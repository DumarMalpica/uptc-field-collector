/// High-level grouping for field metadata forms (`assets/data/*_metadata.json`).
///
/// Add new enum values or assign existing categories when new JSON modules appear.
enum FieldFormCategory {
  geological,
  hydrological,
  biological,
  social,
  other,
}

extension FieldFormCategoryX on FieldFormCategory {
  /// Etiqueta corta para chips / filtros en la UI.
  String get label {
    return switch (this) {
      FieldFormCategory.geological => 'Geológicas',
      FieldFormCategory.hydrological => 'Hídricas',
      FieldFormCategory.biological => 'Biológicas',
      FieldFormCategory.social => 'Sociales',
      FieldFormCategory.other => 'Otras',
    };
  }
}

/// One downloadable form definition backed by a JSON asset.
class FieldFormDefinition {
  const FieldFormDefinition({
    required this.formId,
    required this.title,
    required this.assetPath,
    required this.category,
  });

  final String formId;
  final String title;
  final String assetPath;
  final FieldFormCategory category;
}

/// Catálogo estático: orden y categorías se ajustan aquí sin tocar la UI.
const List<FieldFormDefinition> kFieldFormCatalog = [
  FieldFormDefinition(
    formId: 'modulo_rocas',
    title: 'Registro de Rocas',
    assetPath: 'assets/data/rocks_metadata.json',
    category: FieldFormCategory.geological,
  ),
  FieldFormDefinition(
    formId: 'modulo_suelos',
    title: 'Registro de Suelos',
    assetPath: 'assets/data/soils_metadata.json',
    category: FieldFormCategory.geological,
  ),
  FieldFormDefinition(
    formId: 'modulo_agua',
    title: 'Registro de Calidad de Agua',
    assetPath: 'assets/data/water_metadata.json',
    category: FieldFormCategory.hydrological,
  ),
  FieldFormDefinition(
    formId: 'modulo_vegetacion',
    title: 'Registro de Vegetación',
    assetPath: 'assets/data/plants_metadata.json',
    category: FieldFormCategory.biological,
  ),
  FieldFormDefinition(
    formId: 'modulo_aves',
    title: 'Registro de Aves y Hábitat',
    assetPath: 'assets/data/birds_metadata.json',
    category: FieldFormCategory.biological,
  ),
  FieldFormDefinition(
    formId: 'modulo_componente_social_paisaje',
    title: 'Registro de Componente Social y Paisaje',
    assetPath: 'assets/data/social_metadata.json',
    category: FieldFormCategory.social,
  ),
];

Iterable<FieldFormDefinition> formsInCategory(FieldFormCategory c) =>
    kFieldFormCatalog.where((f) => f.category == c);
