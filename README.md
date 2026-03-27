# Field Colector

Aplicación móvil desarrollada con Flutter.

## Requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK ^3.11.3)

## Ejecutar

Antes de ejecutar, asegurate de tener un emulador corriendo o un dispositivo físico conectado.

```bash
cd field-colector
flutter pub get
flutter run
```

## Ejecutar módulos por separado

- **Con UI:** Crear un `lib/main_modulo.dart` y ejecutar con `flutter run -t lib/main_modulo.dart`
- **Sin UI (lógica pura):** Crear un script en `bin/` y ejecutar con `dart run bin/mi_script.dart`
- **Tests:** `flutter test test/mi_modulo_test.dart`
