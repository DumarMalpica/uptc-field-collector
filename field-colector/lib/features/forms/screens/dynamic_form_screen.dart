/// Pantalla de formulario generado: datos comunes + módulo científico.
///
/// Consume [FormProvider] vía [Consumer]: estados de carga y error, lista
/// desplazable de campos visibles con separadores por sección (comunes vs
/// título del catálogo), y [FieldWidgetFactory] para cada fila.
///
/// [catalogEntry] identifica el módulo en [FieldFormDefinition]; el proveedor
/// ya incluye campos fusionados desde `common_data.json`.
import 'dart:async';

import 'package:field_colector/core/services/record_submit_service.dart';
import 'package:field_colector/domain/ports/sync_port.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/dashboard/data/field_form_catalog.dart';
import 'package:field_colector/features/expeditions/providers/field_session_provider.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/widgets/field_widget_factory.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

/// Pantalla con barra superior (volver + título del catálogo) y cuerpo del formulario.
class DynamicFormScreen extends StatefulWidget {
  const DynamicFormScreen({
    super.key,
    required this.catalogEntry,
    required this.onBack,
    this.onSubmitted,
  });

  final FieldFormDefinition catalogEntry;
  final VoidCallback onBack;
  final VoidCallback? onSubmitted;

  @override
  State<DynamicFormScreen> createState() => _DynamicFormScreenState();
}

class _DynamicFormScreenState extends State<DynamicFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  String _sectionTitle(int section) {
    if (section == 0) {
      return 'Datos comunes';
    }
    return widget.catalogEntry.title;
  }

  Future<void> _onSubmit(FormProvider form) async {
    if (!form.allVisibleRequiredFieldsFilled) return;
    if (!_formKey.currentState!.validate()) return;

    final outingId = context.read<FieldSessionProvider>().activeOutingId;
    if (outingId == null || outingId.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Activa una expedición en campo antes de guardar'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    final userId = context.read<Authprovider>().user?.id ?? '';
    if (userId.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Sesión no válida'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    try {
      await context.read<RecordSubmitService>().submit(
            moduleFormId: form.moduleFormId,
            values: form.values,
            outingId: outingId,
            userId: userId,
          );
      await form.clearPersistedDraft();
      form.markSkipPersistOnDispose();

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro guardado localmente'),
          behavior: SnackBarBehavior.floating,
        ),
      );

      final sync = context.read<SyncPort>();
      unawaited(
        sync.syncPendingData().then((result) {
          if (!mounted || result.failed == 0) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${result.synced} sincronizados, ${result.failed} fallaron',
              ),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }),
      );

      widget.onSubmitted?.call();
      widget.onBack();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al guardar: $e'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FormProvider>(
      builder: (context, form, _) {
        if (form.isLoading) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FormAppBar(title: widget.catalogEntry.title, onBack: widget.onBack),
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          );
        }

        if (form.errorMessage != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _FormAppBar(title: widget.catalogEntry.title, onBack: widget.onBack),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        PhosphorIconsRegular.warningCircle,
                        size: 48,
                        color: AppColors.textSecondary.withValues(alpha: 0.6),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        form.errorMessage!,
                        textAlign: TextAlign.center,
                        style: AppStyles.body,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

        final visible = form.visibleFieldsOrdered();
        final canSubmit = form.allVisibleRequiredFieldsFilled && !_isSubmitting;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _FormAppBar(title: widget.catalogEntry.title, onBack: widget.onBack),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
                  itemCount: visible.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, i) {
                    final field = visible[i];
                    final showHeader =
                        i == 0 || visible[i - 1].formSection != field.formSection;
                    final header = showHeader
                        ? Padding(
                            padding: EdgeInsets.only(bottom: 8, top: i == 0 ? 0 : 12),
                            child: Text(
                              _sectionTitle(field.formSection),
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          )
                        : null;

                    final fieldWidget = AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: Padding(
                        key: ValueKey(field.fieldId),
                        padding: EdgeInsets.zero,
                        child: FieldWidgetFactory.build(field: field, provider: form),
                      ),
                    );

                    if (header != null) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          header,
                          fieldWidget,
                        ],
                      );
                    }
                    return fieldWidget;
                  },
                ),
              ),
            ),
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
                onPressed: canSubmit ? () => _onSubmit(form) : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textOnPrimary,
                  disabledBackgroundColor:
                      AppColors.primary.withValues(alpha: 0.35),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                icon: _isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppColors.textOnPrimary,
                        ),
                      )
                    : const Icon(Icons.save_outlined, size: 20),
                label: Text(
                  _isSubmitting ? 'Guardando...' : 'Guardar registro',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FormAppBar extends StatelessWidget {
  const _FormAppBar({required this.title, required this.onBack});

  final String title;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 8, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: onBack,
            icon: const Icon(Icons.arrow_back),
            color: AppColors.textPrimary,
          ),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
