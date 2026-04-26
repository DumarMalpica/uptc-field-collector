import 'package:flutter/material.dart';

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
                  surfaceTintColor: Theme.of(context).colorScheme.surfaceTint,
                  child: SafeArea(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Icon(
                          Icons.settings,
                          size: 28,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ),
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
