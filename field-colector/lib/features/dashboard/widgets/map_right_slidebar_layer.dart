import 'package:flutter/material.dart';

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
    this.child,
  });

  final Animation<Offset> slideAnimation;
  final VoidCallback onBackdropTap;

  /// Contenido que se muestra dentro del panel deslizable.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final colors = Theme.of(context).colorScheme;

    return Positioned.fill(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRect(
            child: SlideTransition(
              position: slideAnimation,
              child: SizedBox(
                width: w - 52,
                child: Material(
                  elevation: 10,
                  surfaceTintColor: colors.surfaceTint,
                  child: SafeArea(
                    child: child ?? const SizedBox.expand(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onBackdropTap,
              behavior: HitTestBehavior.opaque,
              child: ColoredBox(
                color: Colors.black.withValues(alpha: 0.28),
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
    return SizedBox(
      width: 36,
      height: 36,
      child: IconButton(
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(
          backgroundColor: isActive
              ? colors.primaryContainer
              : colors.surfaceContainerHigh,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onTap,
        icon: Icon(
          icon,
          size: 20,
          color: isActive ? colors.primary : colors.onSurface,
        ),
      ),
    );
  }
}
