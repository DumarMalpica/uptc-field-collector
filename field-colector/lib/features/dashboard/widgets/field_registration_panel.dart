/// Panel lateral del mapa: catálogo de formularios por categoría y apertura del dinámico.
///
/// Flujo: chips de [FieldFormCategory] → lista de [FieldFormDefinition] desde
/// [kFieldFormCatalog]. Al elegir un ítem se crea [FormProvider] en estado y
/// [DynamicFormScreen], con borradores vía [FormDraftService].
import 'dart:async';

import 'package:field_colector/core/database/form_draft_service.dart';
import 'package:field_colector/features/dashboard/data/field_form_catalog.dart';
import 'package:field_colector/features/forms/providers/form_provider.dart';
import 'package:field_colector/features/forms/screens/dynamic_form_screen.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:provider/provider.dart';

class FieldRegistrationPanel extends StatefulWidget {
  const FieldRegistrationPanel({super.key});

  @override
  FieldRegistrationPanelState createState() => FieldRegistrationPanelState();
}

class FieldRegistrationPanelState extends State<FieldRegistrationPanel> {
  FieldFormCategory _category = FieldFormCategory.geological;
  FieldFormDefinition? _selectedForm;
  FormProvider? _formProvider;

  static final List<FieldFormCategory> _categoryOrder = [
    FieldFormCategory.geological,
    FieldFormCategory.hydrological,
    FieldFormCategory.biological,
    FieldFormCategory.social,
    FieldFormCategory.other,
  ];

  bool get isFormOpen => _selectedForm != null;

  Future<void> flushOpenFormDraft() async {
    await _formProvider?.saveDraftNow();
  }

  Future<void> discardOpenFormDraft() async {
    final path = _selectedForm?.assetPath;
    _formProvider?.markSkipPersistOnDispose();
    _disposeFormProvider();
    if (path != null && mounted) {
      await context.read<FormDraftService>().clearDraft(path);
    }
    if (mounted) {
      setState(() => _selectedForm = null);
    }
  }

  Future<void> closeFormToCatalog() async {
    await flushOpenFormDraft();
    _disposeFormProvider();
    if (mounted) {
      setState(() => _selectedForm = null);
    }
  }

  void _disposeFormProvider() {
    _formProvider?.dispose();
    _formProvider = null;
  }

  void _openForm(FieldFormDefinition f) {
    final draftSvc = context.read<FormDraftService>();
    _disposeFormProvider();
    final p = FormProvider(draftService: draftSvc);
    setState(() {
      _selectedForm = f;
      _formProvider = p;
    });
    unawaited(p.loadForm(f.assetPath));
  }

  @override
  void dispose() {
    _disposeFormProvider();
    super.dispose();
  }

  IconData _categoryIcon(FieldFormCategory c) {
    return switch (c) {
      FieldFormCategory.geological => PhosphorIconsRegular.mountains,
      FieldFormCategory.hydrological => PhosphorIconsRegular.dropHalf,
      FieldFormCategory.biological => PhosphorIconsRegular.leaf,
      FieldFormCategory.social => PhosphorIconsRegular.usersThree,
      FieldFormCategory.other => PhosphorIconsRegular.dotsThreeOutline,
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedForm != null && _formProvider != null) {
      return ChangeNotifierProvider<FormProvider>.value(
        value: _formProvider!,
        child: DynamicFormScreen(
          catalogEntry: _selectedForm!,
          onBack: () {
            unawaited(closeFormToCatalog());
          },
        ),
      );
    }

    final draftSvc = context.watch<FormDraftService>();
    final draftPaths = draftSvc.modulePathsWithDrafts;

    final items = formsInCategory(_category).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: Text(
            'Formularios de registro',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final c in _categoryOrder) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: FilterChip(
                      showCheckmark: false,
                      avatar: Icon(
                        _categoryIcon(c),
                        size: 18,
                        color: _category == c
                            ? AppColors.textOnPrimary
                            : AppColors.textSecondary,
                      ),
                      label: Text(c.label),
                      selected: _category == c,
                      onSelected: (_) => setState(() => _category = c),
                      selectedColor: AppColors.primary,
                      labelStyle: TextStyle(
                        color: _category == c
                            ? AppColors.textOnPrimary
                            : AppColors.textPrimary,
                        fontWeight:
                            _category == c ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: items.isEmpty
              ? _EmptyCategoryMessage(category: _category)
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, i) {
                    final f = items[i];
                    final hasDraft = draftPaths.contains(f.assetPath);
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => _openForm(f),
                        child: Ink(
                          decoration: AppStyles.card,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Icon(
                                      PhosphorIconsRegular.fileText,
                                      color: AppColors.primary,
                                      size: 28,
                                    ),
                                    if (hasDraft)
                                      Positioned(
                                        right: -2,
                                        top: -2,
                                        child: Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                            color: AppColors.accent,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                                const SizedBox(width: 14),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        f.title,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        f.formId,
                                        style: AppStyles.caption,
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  PhosphorIconsRegular.caretRight,
                                  color: AppColors.textSecondary,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

class _EmptyCategoryMessage extends StatelessWidget {
  const _EmptyCategoryMessage({required this.category});

  final FieldFormCategory category;

  @override
  Widget build(BuildContext context) {
    final text = switch (category) {
      FieldFormCategory.social =>
        'Aún no hay formularios sociales en los datos locales.',
      FieldFormCategory.other =>
        'Reservado para nuevos módulos (economía, clima, etc.).',
      _ =>
        'No hay formularios en esta categoría. Revisa el catálogo en código.',
    };
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.body,
        ),
      ),
    );
  }
}
