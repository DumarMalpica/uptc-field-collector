import 'package:field_colector/domain/entities/outing.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/expeditions/widgets/location_picker_widget.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

/// Pantalla de creación de expedición.
///
/// Recopila todos los campos de [Outing]. La ubicación (lat/lon/alt) se
/// selecciona mediante [LocationPickerWidget] con mapa embebido.
///
/// **Adaptador de persistencia no implementado aún.** El submit construye
/// el [Outing] pero solo muestra un SnackBar informando que la creación
/// estará disponible próximamente.
class ExpeditionCreateScreen extends StatefulWidget {
  const ExpeditionCreateScreen({
    super.key,
    required this.onBack,
    this.onCreated,
  });

  final VoidCallback onBack;

  /// Callback opcional cuando se cree la expedición (futuro).
  final ValueChanged<Outing>? onCreated;

  @override
  State<ExpeditionCreateScreen> createState() => _ExpeditionCreateScreenState();
}

class _ExpeditionCreateScreenState extends State<ExpeditionCreateScreen> {
  final _formKey = GlobalKey<FormState>();

  // ── Text controllers ──
  final _nameCtrl = TextEditingController();
  final _prefixCtrl = TextEditingController();
  final _locationCtrl = TextEditingController();
  final _zoneCtrl = TextEditingController();
  final _reasonCtrl = TextEditingController();

  // ── Dates ──
  DateTime? _startDate;
  DateTime? _endDate;

  // ── Location from map picker ──
  PickedLocation? _pickedLocation;

  // ── Map expanded state ──
  bool _mapExpanded = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _prefixCtrl.dispose();
    _locationCtrl.dispose();
    _zoneCtrl.dispose();
    _reasonCtrl.dispose();
    super.dispose();
  }

  // ── Date picker ──
  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final initial = isStart
        ? (_startDate ?? now)
        : (_endDate ?? _startDate ?? now);
    final first = isStart ? now.subtract(const Duration(days: 365)) : (_startDate ?? now);

    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: first,
      lastDate: now.add(const Duration(days: 365 * 2)),
      locale: const Locale('es'),
    );

    if (picked != null && mounted) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          // Reset end if before start
          if (_endDate != null && _endDate!.isBefore(picked)) {
            _endDate = null;
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

  // ── Submit ──
  void _onSubmit() {
    if (!_formKey.currentState!.validate()) return;

    if (_pickedLocation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona una ubicación en el mapa'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Selecciona fecha de inicio y fin'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final currentUser = context.read<Authprovider>().user;
    final userId = currentUser?.id ?? '';

    final outing = Outing(
      id: '', // TODO(adapter): generar ID en adaptador
      prefix: _prefixCtrl.text.trim(),
      name: _nameCtrl.text.trim(),
      location: _locationCtrl.text.trim(),
      zone: _zoneCtrl.text.trim(),
      reason: _reasonCtrl.text.trim(),
      latitude: _pickedLocation!.latitude,
      longitude: _pickedLocation!.longitude,
      altitude: _pickedLocation!.altitude,
      startDate: _startDate!,
      endDate: _endDate!,
      createdById: userId,
      participantIds: [userId],
      status: 'draft',
      syncStatus: 'pending',
    );

    // TODO(adapter): llamar OutingRemotePort.saveOuting(outing) cuando exista
    // el adaptador de creación de expedición.
    // widget.onCreated?.call(outing);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Próximamente: crear expedición'),
        behavior: SnackBarBehavior.floating,
      ),
    );

    // Log para debugging durante desarrollo.
    debugPrint('[ExpeditionCreate] Outing construido: ${outing.name} '
        '(${outing.latitude}, ${outing.longitude}, ${outing.altitude}m)');
  }

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd MMM yyyy', 'es');

    return Column(
      children: [
        // ── Header ──
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: widget.onBack,
              ),
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  'Nueva expedición',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),

        const Divider(height: 1),

        // ── Form ──
        Expanded(
          child: Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // ── General info section ──
                const _SectionTitle('Información general'),
                const SizedBox(height: 8),

                TextFormField(
                  controller: _prefixCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Prefijo *',
                    hintText: 'EXP-ABC',
                    prefixIcon: Icon(Icons.tag, size: 20),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Nombre *',
                    hintText: 'Expedición Boyacá Centro',
                    prefixIcon: Icon(Icons.badge_outlined, size: 20),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _locationCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Ubicación *',
                    hintText: 'Tunja, Boyacá',
                    prefixIcon: Icon(Icons.location_city, size: 20),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _zoneCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Zona *',
                    hintText: 'Altiplano Cundiboyacense',
                    prefixIcon: Icon(Icons.landscape, size: 20),
                  ),
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                ),
                const SizedBox(height: 12),

                TextFormField(
                  controller: _reasonCtrl,
                  decoration: const InputDecoration(
                    labelText: 'Razón *',
                    hintText: 'Inventario de flora nativa...',
                    prefixIcon: Icon(Icons.description_outlined, size: 20),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 3,
                  validator: (v) =>
                      (v == null || v.trim().isEmpty) ? 'Requerido' : null,
                ),
                const SizedBox(height: 20),

                // ── Dates section ──
                const _SectionTitle('Fechas'),
                const SizedBox(height: 8),

                Row(
                  children: [
                    Expanded(
                      child: _DatePickerField(
                        label: 'Inicio *',
                        value: _startDate != null
                            ? dateFormat.format(_startDate!)
                            : null,
                        onTap: () => _pickDate(isStart: true),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _DatePickerField(
                        label: 'Fin *',
                        value: _endDate != null
                            ? dateFormat.format(_endDate!)
                            : null,
                        onTap: () => _pickDate(isStart: false),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // ── Location section ──
                const _SectionTitle('Ubicación en mapa'),
                const SizedBox(height: 8),

                // Toggle button to show/hide map
                OutlinedButton.icon(
                  onPressed: () =>
                      setState(() => _mapExpanded = !_mapExpanded),
                  icon: Icon(
                    _mapExpanded
                        ? Icons.map
                        : Icons.add_location_alt_outlined,
                    size: 18,
                  ),
                  label: Text(
                    _mapExpanded
                        ? 'Ocultar mapa'
                        : _pickedLocation != null
                            ? 'Cambiar ubicación'
                            : 'Seleccionar en mapa',
                  ),
                ),
                const SizedBox(height: 8),

                // Show selected coords summary when map collapsed
                if (!_mapExpanded && _pickedLocation != null)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.primary,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Lat: ${_pickedLocation!.latitude.toStringAsFixed(4)}'
                            '  Lon: ${_pickedLocation!.longitude.toStringAsFixed(4)}'
                            '  Alt: ${_pickedLocation!.altitude.toStringAsFixed(0)}m',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                // Expandable map
                if (_mapExpanded) ...[
                  LocationPickerWidget(
                    initialLocation: _pickedLocation,
                    onLocationPicked: (loc) {
                      setState(() => _pickedLocation = loc);
                    },
                  ),
                ],

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),

        // ── Bottom submit button ──
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ElevatedButton.icon(
            onPressed: _onSubmit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.textOnPrimary,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            icon: const Icon(Icons.add_circle_outline, size: 20),
            label: const Text(
              'Crear expedición',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Helper widgets ──────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryDark,
        letterSpacing: 0.3,
      ),
    );
  }
}

class _DatePickerField extends StatelessWidget {
  const _DatePickerField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String? value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
        ),
        child: Text(
          value ?? 'Seleccionar',
          style: TextStyle(
            fontSize: 13,
            color: value != null
                ? AppColors.textPrimary
                : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }
}
