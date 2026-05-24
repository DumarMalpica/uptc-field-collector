import 'dart:io';

import 'package:field_colector/domain/mappers/form_mapper_registry.dart';
import 'package:field_colector/domain/ports/photo_local_port.dart';
import 'package:field_colector/features/forms/models/form_schema.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/form_field_label.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

/// Captura de fotos (`type: image_capture`) con cámara o galería.
class FormImageCaptureField extends StatefulWidget {
  const FormImageCaptureField({
    super.key,
    required this.field,
    required this.provider,
  });

  final FormFieldDef field;
  final FormProvider provider;

  static const int maxPhotos = 5;

  @override
  State<FormImageCaptureField> createState() => _FormImageCaptureFieldState();
}

class _FormImageCaptureFieldState extends State<FormImageCaptureField> {
  final ImagePicker _picker = ImagePicker();
  final Map<String, String> _localPaths = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadPaths());
  }

  @override
  void didUpdateWidget(FormImageCaptureField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.provider != widget.provider ||
        oldWidget.field.fieldId != widget.field.fieldId) {
      _loadPaths();
    }
  }

  Future<void> _loadPaths() async {
    final photoLocal = context.read<PhotoLocalPort>();
    final ids = widget.provider.photoIdsFor(widget.field.fieldId);
    final paths = <String, String>{};
    for (final id in ids) {
      final photo = await photoLocal.getPhotoById(id);
      if (photo != null && photo.localPath.isNotEmpty) {
        paths[id] = photo.localPath;
      }
    }
    if (!mounted) return;
    setState(() => _localPaths
      ..clear()
      ..addAll(paths));
  }

  Future<bool> _ensurePermission(ImageSource source) async {
    final permission = source == ImageSource.camera
        ? Permission.camera
        : Permission.photos;
    var status = await permission.status;
    if (status.isGranted) return true;
    status = await permission.request();
    if (status.isGranted) return true;
    if (!mounted) return false;
    if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            source == ImageSource.camera
                ? 'Permiso de cámara denegado. Actívalo en ajustes del sistema.'
                : 'Permiso de galería denegado. Actívalo en ajustes del sistema.',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
    return false;
  }

  Future<void> _pick(ImageSource source) async {
    final ids = widget.provider.photoIdsFor(widget.field.fieldId);
    if (ids.length >= FormImageCaptureField.maxPhotos) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Máximo ${FormImageCaptureField.maxPhotos} fotos por campo',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (!await _ensurePermission(source)) return;

    widget.provider.setCapturingPhoto(true);
    try {
      final file = await _picker.pickImage(
        source: source,
        imageQuality: 90,
        maxWidth: 1920,
        maxHeight: 1920,
      );
      if (file == null) return;

      final bytes = await file.readAsBytes();
      if (!mounted) return;
      final photoLocal = context.read<PhotoLocalPort>();
      final recordType = FormMapperRegistry.recordTypeFor(
        widget.provider.moduleFormId,
      );
      final photoId = await photoLocal.savePhotoLocally(
        bytes,
        widget.provider.draftRecordId,
        widget.field.fieldId,
        recordType: recordType,
      );

      widget.provider.addPhotoId(widget.field.fieldId, photoId);
      await _loadPaths();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No se pudo capturar la foto: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      widget.provider.setCapturingPhoto(false);
    }
  }

  Future<void> _showSourcePicker() async {
    await showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('Tomar foto'),
              onTap: () {
                Navigator.pop(ctx);
                _pick(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('Elegir de galería'),
              onTap: () {
                Navigator.pop(ctx);
                _pick(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _removePhoto(String photoId) async {
    try {
      await context.read<PhotoLocalPort>().deletePhoto(photoId);
    } catch (_) {}
    widget.provider.removePhotoId(widget.field.fieldId, photoId);
    setState(() => _localPaths.remove(photoId));
  }

  @override
  Widget build(BuildContext context) {
    final ids = widget.provider.photoIdsFor(widget.field.fieldId);
    final atLimit = ids.length >= FormImageCaptureField.maxPhotos;

    return InputDecorator(
      decoration: InputDecoration(
        label: FormFieldLabel(text: field.label),
        helperText: field.isRequired ? 'Obligatorio' : null,
        border: const OutlineInputBorder(),
        filled: true,
        fillColor: AppColors.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${ids.length} / ${FormImageCaptureField.maxPhotos} fotos',
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary.withValues(alpha: 0.9),
            ),
          ),
          if (ids.isNotEmpty) ...[
            const SizedBox(height: 10),
            SizedBox(
              height: 88,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: ids.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final photoId = ids[i];
                  final path = _localPaths[photoId];
                  final file =
                      path != null && path.isNotEmpty ? File(path) : null;
                  final exists = file != null && file.existsSync();

                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 88,
                          height: 88,
                          child: exists
                              ? Image.file(file, fit: BoxFit.cover)
                              : ColoredBox(
                                  color: AppColors.primary
                                      .withValues(alpha: 0.08),
                                  child: const Icon(
                                    Icons.image_outlined,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        top: -6,
                        right: -6,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black54,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(24, 24),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          iconSize: 16,
                          onPressed: () => _removePhoto(photoId),
                          icon: const Icon(Icons.close),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: atLimit || widget.provider.isCapturingPhoto
                ? null
                : _showSourcePicker,
            icon: widget.provider.isCapturingPhoto
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.add_a_photo_outlined, size: 20),
            label: Text(
              widget.provider.isCapturingPhoto
                  ? 'Procesando foto…'
                  : 'Añadir fotos',
            ),
          ),
        ],
      ),
    );
  }

  FormFieldDef get field => widget.field;
}
