import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserManualScreen extends StatefulWidget {
  const UserManualScreen({super.key});

  @override
  State<UserManualScreen> createState() => _UserManualScreenState();
}

class _UserManualScreenState extends State<UserManualScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    // Spacing configuration for stacked folder layout
    const double tabHeight = 52.0;

    final List<_ManualCardData> cards = [
      _ManualCardData(
        title: 'Field Collector',
        subtitle: 'Inicio y navegación del manual',
        icon: PhosphorIconsRegular.info,
        baseColor: AppColors.semilleroDarkGreen,
        textColor: Colors.white,
        content: _buildIntroContent(textTheme),
      ),
      _ManualCardData(
        title: 'Mapa',
        subtitle: 'Visualización y filtros de registros',
        icon: PhosphorIconsRegular.mapTrifold,
        baseColor: AppColors.semilleroDeepBlue,
        textColor: Colors.white,
        content: _buildMapContent(textTheme),
      ),
      _ManualCardData(
        title: 'Expediciones',
        subtitle: 'Gestión y sincronización de salidas',
        icon: PhosphorIconsRegular.mountains,
        baseColor: AppColors.semilleroLightGreen,
        textColor: AppColors.semilleroInk,
        content: _buildExpeditionsContent(textTheme),
      ),
      _ManualCardData(
        title: 'Registros',
        subtitle: 'Formularios y toma de datos',
        icon: PhosphorIconsRegular.notePencil,
        baseColor: AppColors.semilleroViolet,
        textColor: Colors.white,
        content: _buildRecordsContent(textTheme),
      ),
      _ManualCardData(
        title: 'Configuraciones',
        subtitle: 'Ajustes del dispositivo y GPS',
        icon: PhosphorIconsRegular.sliders,
        baseColor: AppColors.semilleroMagenta,
        textColor: Colors.white,
        content: _buildSettingsContent(textTheme),
      ),
      _ManualCardData(
        title: 'Cuenta',
        subtitle: 'Perfil y sesión activa',
        icon: PhosphorIconsRegular.user,
        baseColor: AppColors.primary,
        textColor: Colors.white,
        content: _buildAccountContent(textTheme),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.authBeige,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Manual de Usuario',
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenHeight = constraints.maxHeight;
            final N = cards.length;

            return Stack(
              children: List.generate(N, (index) {
                final card = cards[index];
                final isSelected = _selectedIndex == index;

                // Spacing logic:
                // Cards <= selectedIndex stack at the top.
                // Cards > selectedIndex stack at the bottom.
                double topPosition;
                if (index <= _selectedIndex) {
                  topPosition = index * tabHeight;
                } else {
                  topPosition = screenHeight - ((N - index) * tabHeight);
                }

                // Dynamic bottom padding to keep scrollable content visible above the bottom stack
                final double bottomPadding =
                    index < _selectedIndex ? 0 : (N - 1 - index) * tabHeight + 24;

                return AnimatedPositioned(
                  key: ValueKey(index),
                  duration: const Duration(milliseconds: 320),
                  curve: Curves.easeInOutCubic,
                  top: topPosition,
                  left: 8,
                  right: 8,
                  bottom: index <= _selectedIndex ? (isSelected ? 0 : null) : 0,
                  height: isSelected ? (screenHeight - (_selectedIndex * tabHeight)) : (index <= _selectedIndex ? tabHeight + 24 : null),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: card.baseColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 10,
                            offset: const Offset(0, -3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Tab Header
                          SizedBox(
                            height: tabHeight,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Icon(
                                  card.icon,
                                  color: card.textColor,
                                  size: 22,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    card.title.toUpperCase(),
                                    style: AppStyles.subtitle.copyWith(
                                      color: card.textColor,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                ),
                                if (!isSelected)
                                  Icon(
                                    index < _selectedIndex
                                        ? Icons.keyboard_arrow_up
                                        : Icons.keyboard_arrow_down,
                                    color: card.textColor.withValues(alpha: 0.6),
                                    size: 20,
                                  ),
                              ],
                            ),
                          ),

                          // Card Scrollable Content Area (Only if selected/front)
                          if (isSelected)
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Container(
                                  color: AppColors.cloudWhite,
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.fromLTRB(
                                      16,
                                      20,
                                      16,
                                      bottomPadding,
                                    ),
                                    child: card.content,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  // --- Content builders ---

  Widget _buildIntroContent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '¡Bienvenido a Field Collector!',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Esta aplicación es una herramienta de recolección de datos georreferenciados '
          'diseñada para funcionar incluso en las condiciones de conectividad más '
          'desafiantes (Offline-First).',
          style: AppStyles.body,
        ),
        const SizedBox(height: 24),
        _buildGuideSection(
          title: '¿Cómo navegar en este manual?',
          icon: PhosphorIconsRegular.handPointing,
          color: AppColors.semilleroDarkGreen,
          body: 'Las pestañas de colores en el borde superior e inferior representan las '
              'diferentes secciones. Toca cualquiera de ellas para traer la tarjeta al '
              'frente y explorar su contenido de forma interactiva.',
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: PhosphorIconsRegular.wifiSlash,
          title: 'Funcionamiento Offline-First',
          description: 'Los registros tomados en campo se guardan localmente en tu '
              'dispositivo de manera segura. Al recuperar la conectividad, se sincronizan '
              'automáticamente con los servidores de Firestore.',
        ),
        const SizedBox(height: 12),
        _buildInfoItem(
          icon: PhosphorIconsRegular.target,
          title: 'Geolocalización Automática',
          description: 'La aplicación utiliza el GPS de tu dispositivo para vincular '
              'coordenadas y altitud de forma precisa a cada registro del ecosistema.',
        ),
      ],
    );
  }

  Widget _buildMapContent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Exploración en el Mapa',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'El mapa interactivo es el centro de control del colector de campo. Permite ver registros cercanos y orientarte en tiempo real.',
          style: AppStyles.body,
        ),
        const SizedBox(height: 20),
        _buildGuideSection(
          title: 'Elementos Clave del Mapa',
          icon: PhosphorIconsRegular.mapPin,
          color: AppColors.semilleroDeepBlue,
          body: '• Pines de Colores: Cada categoría de registro tiene su propio color.\n'
              '• Radio de 2km: Se muestran los registros subidos en un radio de 2 km a la redonda.\n'
              '• Ubicación: Círculo azul indica tu posición GPS exacta en tiempo real.',
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: PhosphorIconsRegular.funnel,
          title: 'Filtros Dinámicos',
          description: 'Usa el panel de filtros para ocultar o mostrar categorías '
              '(Aves, Suelos, Rocas, etc.) y limpiar la visualización según tu área de enfoque.',
        ),
        const SizedBox(height: 12),
        _buildInfoItem(
          icon: PhosphorIconsRegular.database,
          title: 'Mapas Offline cached',
          description: 'Puedes configurar y descargar previamente las teselas de mapas '
              'para visualizarlos sin señal de internet.',
        ),
      ],
    );
  }

  Widget _buildExpeditionsContent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gestión de Expediciones',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Las expediciones organizan las salidas de campo para los miembros autorizados, permitiendo una toma de datos coordinada.',
          style: AppStyles.body,
        ),
        const SizedBox(height: 20),
        _buildGuideSection(
          title: 'Salida de Campo & Sincronización',
          icon: PhosphorIconsRegular.mountains,
          color: AppColors.semilleroLightGreen,
          body: 'Al iniciar sesión, la app detecta tus salidas y descarga automáticamente '
              'el listado de miembros y detalles para habilitar la recolección local.',
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: PhosphorIconsRegular.usersThree,
          title: 'Unirse a una Expedición',
          description: 'Busca expediciones activas creadas por coordinadores de Citesa y '
              'solicita unirte directamente desde el listado en la aplicación.',
        ),
        const SizedBox(height: 12),
        _buildInfoItem(
          icon: PhosphorIconsRegular.shieldCheck,
          title: 'Permisos de Registro',
          description: 'Solo podrás subir registros vinculados a una expedición activa de la '
              'que seas participante registrado.',
        ),
      ],
    );
  }

  Widget _buildRecordsContent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Toma de Registros en Campo',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'El corazón del colector. La app cuenta con 6 módulos especializados para recolectar datos estructurados y enriquecidos.',
          style: AppStyles.body,
        ),
        const SizedBox(height: 20),
        _buildGuideSection(
          title: 'Los 6 Módulos Especializados',
          icon: PhosphorIconsRegular.tree,
          color: AppColors.semilleroViolet,
          body: '1. Aves: Avistamiento, especie y comportamiento.\n'
              '2. Rocas: Tipo, dureza, estructura y mineralogía.\n'
              '3. Suelos: Textura, pH, color y humedad del suelo.\n'
              '4. Vegetación: Cobertura, tipo de bosque y especies.\n'
              '5. Agua: Calidad, caudal, temperatura y turbidez.\n'
              '6. Social: Observaciones sociales e impactos humanos.',
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: PhosphorIconsRegular.floppyDisk,
          title: 'Autoguardado de Borradores',
          description: 'Si sales de un formulario a medio llenar, la aplicación guardará '
              'un borrador localmente en Isar de forma segura para que no pierdas nada.',
        ),
        const SizedBox(height: 12),
        _buildInfoItem(
          icon: PhosphorIconsRegular.camera,
          title: 'Captura Fotográfica',
          description: 'Toma fotos directamente de la especie o zona de estudio. Las '
              'imágenes se vinculan localmente y se suben al servidor en background.',
        ),
      ],
    );
  }

  Widget _buildSettingsContent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Configuraciones y Ajustes',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Ajusta el comportamiento de geolocalización, sincronización y memoria local de tu dispositivo.',
          style: AppStyles.body,
        ),
        const SizedBox(height: 20),
        _buildGuideSection(
          title: 'Rendimiento y GPS',
          icon: PhosphorIconsRegular.sliders,
          color: AppColors.semilleroMagenta,
          body: '• Precisión GPS: Nivel de exactitud del sensor GPS. Mayor precisión aumenta el consumo de batería.\n'
              '• Formato: Elige ver coordenadas en formato decimal o grados-minutos-segundos.',
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: PhosphorIconsRegular.trash,
          title: 'Mantenimiento de Memoria',
          description: 'Puedes borrar el caché de mapas para liberar espacio, o '
              'eliminar manualmente todos tus borradores locales guardados.',
        ),
        const SizedBox(height: 12),
        _buildInfoItem(
          icon: PhosphorIconsRegular.arrowClockwise,
          title: 'Sincronización Manual',
          description: 'Fuerza la subida inmediata de todas tus fotos y registros locales '
              'pendientes cuando tengas una conexión a internet estable.',
        ),
      ],
    );
  }

  Widget _buildAccountContent(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gestión de tu Cuenta',
          style: textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Información del perfil del investigador y control de sesiones seguras.',
          style: AppStyles.body,
        ),
        const SizedBox(height: 20),
        _buildGuideSection(
          title: 'Perfil del Investigador',
          icon: PhosphorIconsRegular.userCircle,
          color: AppColors.primary,
          body: 'Visualiza tus datos básicos, carrera/estudio de campo de origen, '
              'rol organizativo (estudiante, investigador, coordinador) y fecha de registro.',
        ),
        const SizedBox(height: 20),
        _buildInfoItem(
          icon: PhosphorIconsRegular.key,
          title: 'Sesiones Persistentes',
          description: 'Tu sesión se mantiene iniciada de forma segura mediante un token local '
              'encriptado. No requieres loguearte nuevamente al abrir la app.',
        ),
        const SizedBox(height: 12),
        _buildInfoItem(
          icon: PhosphorIconsRegular.signOut,
          title: 'Cierre de Sesión',
          description: 'El botón de cierre de sesión borrará de forma segura tus datos locales '
              'temporales y te redirigirá a la pantalla de autenticación.',
        ),
      ],
    );
  }

  Widget _buildGuideSection({
    required String title,
    required IconData icon,
    required Color color,
    required String body,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            body,
            style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ManualCardData {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color baseColor;
  final Color textColor;
  final Widget content;

  _ManualCardData({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.baseColor,
    required this.textColor,
    required this.content,
  });
}
