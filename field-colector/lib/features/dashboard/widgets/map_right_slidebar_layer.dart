import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Secciones disponibles en el sidebar.
enum SidebarSection {
  home('Inicio'),
  expeditions('Expediciones'),
  profile('Perfil'),
  settings('Configuración');

  const SidebarSection(this.label);
  final String label;
}

/// Panel lateral que **entra desde la derecha** y ocupa el **90%** del ancho.
///
/// A la izquierda queda un **10%** reactivo al toque ([onBackdropTap]) para
/// cerrar el panel sin lógica extra en la pantalla contenedora.
///
/// El icono de apertura/cierre vive en la pantalla padre (encima del mapa).
class MapRightSlidebarLayer extends StatelessWidget {
  const MapRightSlidebarLayer({
    super.key,
    required this.slideAnimation,
    required this.onBackdropTap,
  });

  final Animation<Offset> slideAnimation;
  final VoidCallback onBackdropTap;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final colors = Theme.of(context).colorScheme;

    return Positioned.fill(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: w * 0.1,
            child: GestureDetector(
              onTap: onBackdropTap,
              behavior: HitTestBehavior.opaque,
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.28),
              ),
            ),
          ),
          ClipRect(
            child: SlideTransition(
              position: slideAnimation,
              child: SizedBox(
                width: w * 0.9,
                child: Material(
                  elevation: 10,
                  surfaceTintColor: colors.surfaceTint,
                  child: const SafeArea(
                    child: SizedBox.expand(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Small reusable icon button ──────────────────────────────────────────────
class SidebarIcon extends StatelessWidget {
  const SidebarIcon({
    super.key,
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: isActive
            ? colors.primaryContainer
            : colors.surfaceContainerHigh,
      ),
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 24,
        color: isActive ? colors.primary : colors.onSurface,
      ),
    );
  }
}
