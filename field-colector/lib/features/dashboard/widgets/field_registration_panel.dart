import 'package:field_colector/features/dashboard/data/field_form_catalog.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Panel lateral: elige categoría y luego un formulario de registro en campo.
class FieldRegistrationPanel extends StatefulWidget {
  const FieldRegistrationPanel({super.key});

  @override
  State<FieldRegistrationPanel> createState() => _FieldRegistrationPanelState();
}

class _FieldRegistrationPanelState extends State<FieldRegistrationPanel> {
  FieldFormCategory _category = FieldFormCategory.geological;
  FieldFormDefinition? _selectedForm;

  static final List<FieldFormCategory> _categoryOrder = [
    FieldFormCategory.geological,
    FieldFormCategory.hydrological,
    FieldFormCategory.biological,
    FieldFormCategory.social,
    FieldFormCategory.other,
  ];

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
    if (_selectedForm != null) {
      return _FormDetailPlaceholder(
        form: _selectedForm!,
        onBack: () => setState(() => _selectedForm = null),
      );
    }

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
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => setState(() => _selectedForm = f),
                        child: Ink(
                          decoration: AppStyles.card,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 14,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  PhosphorIconsRegular.fileText,
                                  color: AppColors.primary,
                                  size: 28,
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

class _FormDetailPlaceholder extends StatelessWidget {
  const _FormDetailPlaceholder({
    required this.form,
    required this.onBack,
  });

  final FieldFormDefinition form;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
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
                  form.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    PhosphorIconsRegular.clipboardText,
                    size: 48,
                    color: AppColors.textSecondary.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Variables y captura de datos: próximamente.',
                    textAlign: TextAlign.center,
                    style: AppStyles.body,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
