/// Captura de posición GPS (`type: gps_capture`).
///
/// Usa [GeolocatorProvider] (misma capa que el resto de la app): permisos,
/// servicio activo y lectura de coordenadas. El resultado se guarda como
/// mapa en [FormProvider] y se notifica a [FormField] para validación de
/// obligatoriedad dentro del [Form] padre.
import 'package:field_colector/domain/ports/locator_provider.dart';
import 'package:field_colector/domain/utils/geo_coords.dart';
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:provider/provider.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/form_field_label.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FormGpsCaptureField extends StatefulWidget {
  const FormGpsCaptureField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  @override
  State<FormGpsCaptureField> createState() => _FormGpsCaptureFieldState();
}

class _FormGpsCaptureFieldState extends State<FormGpsCaptureField> {
  bool _busy = false;
  String? _error;
  final GlobalKey<FormFieldState<Map<String, dynamic>?>> _formFieldKey =
      GlobalKey<FormFieldState<Map<String, dynamic>?>>();

  Future<void> _capture() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      final locator = context.read<LocatorProvider>();
      final ok = await locator.checkLocationPermissions()
          ? true
          : await locator.requestLocationPermissions();
      if (!ok) {
        setState(() {
          _busy = false;
          _error = 'Permiso de ubicación denegado';
        });
        return;
      }
      if (!await locator.isLocationEnabled()) {
        setState(() {
          _busy = false;
          _error = 'Ubicación desactivada en el dispositivo';
        });
        return;
      }
      final c = await locator.getCurrentLocation();
      if (!isValidLatLng(c.latitude, c.longitude)) {
        setState(() {
          _busy = false;
          _error = 'GPS devolvió coordenadas inválidas';
        });
        return;
      }
      final map = <String, dynamic>{
        'latitude': c.latitude,
        'longitude': c.longitude,
        'altitude': c.altitude,
        'gpsAccuracy': c.gpsAccuracy,
        'manuallyEdited': c.manuallyEdited,
      };
      widget.provider.setValue(widget.field.fieldId, map);
      _formFieldKey.currentState?.didChange(map);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  String _summary(dynamic v) {
    if (v is! Map) return 'Sin captura';
    final lat = v['latitude'];
    final lng = v['longitude'];
    final alt = v['altitude'];
    return 'Lat $lat, Lng $lng, Alt $alt m';
  }

  @override
  Widget build(BuildContext context) {
    final raw = widget.provider.valueFor(widget.field.fieldId);

    return FormField<Map<String, dynamic>?>(
      key: _formFieldKey,
      initialValue: raw is Map<String, dynamic> ? raw : null,
      validator: widget.field.isRequired
          ? (v) {
              if (v == null || v.isEmpty) {
                return 'Capture la ubicación GPS';
              }
              return null;
            }
          : null,
      builder: (state) {
        final map = widget.provider.valueFor(widget.field.fieldId);
        return InputDecorator(
          decoration: InputDecoration(
            label: FormFieldLabel(text: widget.field.label),
            errorText: state.errorText ?? _error,
            border: const OutlineInputBorder(),
            filled: true,
            fillColor: AppColors.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _summary(map),
                style: const TextStyle(fontSize: 13, color: AppColors.textPrimary),
              ),
              const SizedBox(height: 10),
              FilledButton.tonalIcon(
                onPressed: _busy ? null : _capture,
                icon: _busy
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.my_location, size: 20),
                label: Text(_busy ? 'Capturando…' : 'Capturar GPS'),
              ),
            ],
          ),
        );
      },
    );
  }
}
