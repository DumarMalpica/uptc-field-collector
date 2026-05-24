import 'bird_form_mapper.dart';
import 'form_record_mapper.dart';
import 'rock_form_mapper.dart';
import 'soil_form_mapper.dart';
import 'social_form_mapper.dart';
import 'vegetation_form_mapper.dart';
import 'water_form_mapper.dart';

/// Resuelve el mapper de formulario dinámico según `form_id` del módulo JSON.
class FormMapperRegistry {
  static const String moduloAves = 'modulo_aves';
  static const String moduloRocas = 'modulo_rocas';
  static const String moduloSuelos = 'modulo_suelos';
  static const String moduloVegetacion = 'modulo_vegetacion';
  static const String moduloAgua = 'modulo_agua';
  static const String moduloSocial = 'modulo_componente_social_paisaje';

  final BirdFormMapper bird = BirdFormMapper();
  final RockFormMapper rock = RockFormMapper();
  final SoilFormMapper soil = SoilFormMapper();
  final VegetationFormMapper vegetation = VegetationFormMapper();
  final WaterFormMapper water = WaterFormMapper();
  final SocialFormMapper social = SocialFormMapper();

  FormRecordMapper<dynamic>? mapperFor(String moduleFormId) {
    return switch (moduleFormId) {
      moduloAves => bird,
      moduloRocas => rock,
      moduloSuelos => soil,
      moduloVegetacion => vegetation,
      moduloAgua => water,
      moduloSocial => social,
      _ => null,
    };
  }

  bool supports(String moduleFormId) => mapperFor(moduleFormId) != null;

  /// Tipo de registro usado en Cloudinary/Firestore para fotos del módulo.
  static String recordTypeFor(String moduleFormId) => switch (moduleFormId) {
        moduloAves => 'bird',
        moduloRocas => 'rock',
        moduloSuelos => 'soil',
        moduloVegetacion => 'vegetation',
        moduloAgua => 'water',
        moduloSocial => 'social',
        _ => 'unknown',
      };
}
