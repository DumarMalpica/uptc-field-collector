# Citesa Field Colector

Aplicación móvil de recolección de datos en campo, desarrollada con Flutter.

---

## Requisitos previos

Antes de empezar, asegurate de tener instalado lo siguiente en tu máquina:

| Herramienta | Versión mínima | Enlace |
|---|---|---|
| Flutter SDK | Dart ^3.11.3 | [Instalar Flutter](https://docs.flutter.dev/get-started/install) |
| Android Studio o Android SDK | Última estable | [Descargar](https://developer.android.com/studio) |
| Git | cualquiera | [Descargar](https://git-scm.com/) |

> **Nota:** Android Studio no es obligatorio como editor, pero sí se necesita el **Android SDK** y las **Android SDK Command-line Tools** que vienen con él. Si usás VS Code o Cursor como editor, solo instalá Android Studio para obtener el SDK.

### Verificar la instalación

Ejecutá este comando y resolvé cualquier problema que aparezca:

```bash
flutter doctor
```

Deberías ver checks verdes (✓) en al menos:

- Flutter
- Android toolchain
- Connected device (una vez que conectes el celular)

---

## Clonar el repositorio

```bash
git clone <URL-del-repositorio>
cd field-colector
```

---

## Preparar tu celular Android para desarrollo

### 1. Activar Opciones de desarrollador

1. Abrí **Configuración** en tu celular.
2. Andá a **Acerca del teléfono** (o **Información del dispositivo**).
3. Buscá **Número de compilación** (en algunos celulares está dentro de **Información de software**).
4. Tocá **7 veces** sobre "Número de compilación" hasta que aparezca el mensaje _"Ahora eres un desarrollador"_.

### 2. Activar Depuración USB

1. Volvé a **Configuración**.
2. Entrá a **Opciones de desarrollador** (aparece ahora como nuevo menú).
3. Activá **Depuración USB**.
4. (Opcional pero recomendado) Activá también **Instalar vía USB** si aparece la opción.

### 3. Conectar el celular a la computadora

1. Conectá el celular con un cable USB que soporte datos (no todos los cables sirven).
2. En la notificación que aparece en el celular, cambiá el modo USB a **Transferencia de archivos (MTP)**.
3. Si aparece un diálogo pidiendo **"¿Permitir depuración USB?"**, tocá **Permitir** (marcá "Recordar siempre" si querés).

### 4. Verificar que Flutter detecta tu dispositivo

```bash
flutter devices
```

Deberías ver tu celular en la lista, por ejemplo:

```
SM A156B (mobile) • RXXXXXXXXX • android-arm64 • Android 15 (API 35)
```

---

## Instalar dependencias y ejecutar la app

```bash
cd field-colector
flutter pub get
flutter run
```

Si tenés varios dispositivos conectados (emulador + celular), Flutter te va a pedir que elijas uno. Podés especificarlo directamente:

```bash
flutter run -d <device-id>
```

El `device-id` es el código que aparece en `flutter devices` (ej: `RXXXXXXXXX`).

### Hot Reload y Hot Restart

Una vez que la app está corriendo:

- **Hot Reload** — Presioná `r` en la terminal. Aplica cambios de UI al instante sin perder el estado.
- **Hot Restart** — Presioná `R` en la terminal. Reinicia la app completa (pierde el estado).
- **Detener** — Presioná `q` en la terminal.

---

## Estructura del proyecto

```
field-colector/
├── lib/
│   ├── main.dart                          # Punto de entrada
│   ├── domain/
│   │   └── entities/                      # Entidades de dominio
│   └── features/
│       ├── auth/                          # Autenticación (login, providers)
│       ├── dashboard/                     # Dashboard principal
│       ├── home/                          # Pantalla home y loading
│       └── utilities/
│           └── theme/                     # Colores, estilos y tema
├── android/                               # Configuración nativa Android
├── ios/                                   # Configuración nativa iOS
├── pubspec.yaml                           # Dependencias del proyecto
└── pubspec.lock                           # Versiones fijadas
```

---

## Ejecutar módulos por separado

- **Con UI:** Crear un `lib/main_modulo.dart` y ejecutar con `flutter run -t lib/main_modulo.dart`
- **Sin UI (lógica pura):** Crear un script en `bin/` y ejecutar con `dart run bin/mi_script.dart`
- **Tests:** `flutter test test/mi_modulo_test.dart`
