import 'package:field_colector/features/branding/widgets/animated_semillero_label.dart';
import 'package:flutter/material.dart';

/// Bloque reutilizable: etiqueta animada + logo Citesa Research.
class CitesaBrandingBlock extends StatelessWidget {
  const CitesaBrandingBlock({super.key});

  static const String citesaLogo = 'assets/logo/citesa.png';

  /// Tras recorte de márgenes negros del PNG (1442×1153).
  static const double _logoAspectRatio = 1442 / 1153;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    final logoHeight = screen.height * 0.34;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : screen.width;
        final logoWidth = logoHeight * _logoAspectRatio;
        final displayWidth = logoWidth > maxWidth ? maxWidth : logoWidth;
        final displayHeight = displayWidth / _logoAspectRatio;

        return SizedBox(
          width: maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const AnimatedSemilleroLabel(),
              const SizedBox(height: 16),
              Image.asset(
                citesaLogo,
                width: displayWidth,
                height: displayHeight,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
                filterQuality: FilterQuality.high,
              ),
            ],
          ),
        );
      },
    );
  }
}
