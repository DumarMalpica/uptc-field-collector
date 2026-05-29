import 'dart:math' as math;

import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

/// Sistema visual "Cuaderno de campo digital" para GEMS
/// (Geospatial Environmental Monitoring System).
///
/// Reúne los componentes vectoriales y de layout compartidos por las
/// pantallas de splash, login y registro: wordmark, ola de transición,
/// emblema botánico, siluetas de hoja, campos etiquetados y feedback.
class GemsDesign {
  GemsDesign._();

  /// Radio de inputs (8px) y de botones CTA (10px).
  static const double fieldRadius = 8;
  static const double ctaRadius = 10;
}

// ── Wordmark ──────────────────────────────────────────────────────────────

/// Wordmark "GEMS": peso 700, tracking 0.15em, con una letra de acento.
class GemsWordmark extends StatelessWidget {
  const GemsWordmark({
    super.key,
    this.fontSize = 28,
    required this.baseColor,
    required this.accentColor,
    this.accentLetter = 'E',
  });

  final double fontSize;
  final Color baseColor;
  final Color accentColor;
  final String accentLetter;

  @override
  Widget build(BuildContext context) {
    const word = 'GEMS';
    var accentUsed = false;
    final spans = <TextSpan>[];
    for (final ch in word.split('')) {
      final isAccent = !accentUsed && ch == accentLetter;
      if (isAccent) accentUsed = true;
      spans.add(
        TextSpan(
          text: ch,
          style: TextStyle(color: isAccent ? accentColor : baseColor),
        ),
      );
    }
    return Text.rich(
      TextSpan(children: spans),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        letterSpacing: fontSize * 0.15,
        height: 1,
      ),
    );
  }
}

// ── Header con ola de transición ──────────────────────────────────────────

/// Header verde con borde inferior en ola orgánica (curva bezier) que
/// transiciona hacia el cuerpo crema. Lleva una silueta de hoja al top-right.
class GemsWaveHeader extends StatelessWidget {
  const GemsWaveHeader({
    super.key,
    required this.height,
    required this.color,
    required this.child,
    this.leafColor = Colors.white,
  });

  final double height;
  final Color color;
  final Widget child;
  final Color leafColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipPath(
              clipper: _GemsHeaderWaveClipper(),
              child: ColoredBox(color: color),
            ),
          ),
          Positioned(
            top: -8,
            right: -10,
            child: IgnorePointer(
              child: CustomPaint(
                size: const Size(120, 120),
                painter: _GemsLeafPainter(
                  color: leafColor.withValues(alpha: 0.15),
                ),
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}

/// Recorta el header dejando una ola suave en el borde inferior.
/// Equivale al path SVG "M0 28 Q55 0 110 14 Q165 28 220 4 L220 28 Z".
class _GemsHeaderWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final w = size.width;
    final h = size.height;
    const band = 26.0;
    final top = h - band;
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, h)
      ..quadraticBezierTo(w * 0.25, top, w * 0.5, top + band * 0.5)
      ..quadraticBezierTo(w * 0.75, h, w, top + band * 0.14)
      ..lineTo(w, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

/// Silueta de hoja (tallo + 2 lóbulos), trazo delgado. Motivo decorativo.
class _GemsLeafPainter extends CustomPainter {
  _GemsLeafPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final w = size.width;
    final h = size.height;

    canvas.drawPath(
      Path()
        ..moveTo(w * 0.55, h)
        ..quadraticBezierTo(w * 0.5, h * 0.45, w * 0.58, h * 0.04),
      p,
    );

    canvas.drawPath(
      Path()
        ..moveTo(w * 0.55, h * 0.5)
        ..quadraticBezierTo(w * 0.18, h * 0.42, w * 0.08, h * 0.12)
        ..quadraticBezierTo(w * 0.42, h * 0.26, w * 0.55, h * 0.5),
      p,
    );

    canvas.drawPath(
      Path()
        ..moveTo(w * 0.57, h * 0.34)
        ..quadraticBezierTo(w * 0.9, h * 0.26, w * 0.96, h * 0.0)
        ..quadraticBezierTo(w * 0.66, h * 0.12, w * 0.57, h * 0.34),
      p,
    );
  }

  @override
  bool shouldRepaint(covariant _GemsLeafPainter oldDelegate) =>
      oldDelegate.color != color;
}

// ── Emblema botánico central (splash) ─────────────────────────────────────

/// Logotipo circular con ilustración botánica vectorial inline.
class GemsBotanicalEmblem extends StatelessWidget {
  const GemsBotanicalEmblem({super.key, this.size = 132});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _GemsEmblemPainter(),
    );
  }
}

class _GemsEmblemPainter extends CustomPainter {
  void _leaf(
    Canvas canvas,
    Offset center,
    double angleDeg,
    Color color,
    double opacity,
  ) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(angleDeg * math.pi / 180);
    final paint = Paint()..color = color.withValues(alpha: opacity);
    canvas.drawOval(
      Rect.fromCenter(center: Offset.zero, width: 40, height: 20),
      paint,
    );
    canvas.restore();
  }

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / 120;
    canvas.scale(s, s);
    const center = Offset(60, 60);

    canvas.drawCircle(
      center,
      52,
      Paint()..color = AppColors.emblemFill,
    );
    canvas.drawCircle(
      center,
      52,
      Paint()
        ..color = AppColors.semilleroViolet
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );

    final stem = Paint()
      ..color = AppColors.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(
      Path()
        ..moveTo(60, 98)
        ..lineTo(60, 40),
      stem,
    );

    final roots = Paint()
      ..color = AppColors.semilleroViolet
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(
      Path()
        ..moveTo(60, 96)
        ..quadraticBezierTo(48, 102, 42, 110),
      roots,
    );
    canvas.drawPath(
      Path()
        ..moveTo(60, 96)
        ..quadraticBezierTo(72, 102, 78, 110),
      roots,
    );

    _leaf(canvas, const Offset(48, 60), -35, AppColors.semilleroDeepBlue, 0.78);
    _leaf(canvas, const Offset(76, 52), 25, AppColors.semilleroLightGreen, 0.8);
    _leaf(canvas, const Offset(52, 44), -20, AppColors.primaryDark, 0.75);

    canvas.drawCircle(
      const Offset(60, 38),
      4,
      Paint()..color = AppColors.accent,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Fondo decorativo del splash ───────────────────────────────────────────

/// Círculo difuso en esquina superior derecha + tallo con hojas tenue.
class GemsSplashBackdrop extends StatelessWidget {
  const GemsSplashBackdrop({super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        size: Size.infinite,
        painter: _GemsBackdropPainter(),
      ),
    );
  }
}

class _GemsBackdropPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final blob = Paint()
      ..color = AppColors.semilleroViolet.withValues(alpha: 0.18)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 28);
    canvas.drawCircle(
      Offset(size.width * 0.92, size.height * 0.07),
      size.width * 0.28,
      blob,
    );

    final stroke = Paint()
      ..color = AppColors.secondary.withValues(alpha: 0.35)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;

    final baseX = size.width * 0.16;
    final topY = size.height * 0.12;
    final botY = size.height * 0.5;
    canvas.drawPath(
      Path()
        ..moveTo(baseX, botY)
        ..quadraticBezierTo(baseX - 6, (topY + botY) / 2, baseX + 4, topY),
      stroke,
    );

    void leaf(double cy, double angle, double w) {
      canvas.save();
      canvas.translate(baseX, cy);
      canvas.rotate(angle * math.pi / 180);
      canvas.drawOval(
        Rect.fromCenter(center: Offset.zero, width: w, height: w * 0.45),
        stroke,
      );
      canvas.restore();
    }

    leaf(botY - (botY - topY) * 0.25, -32, 70);
    leaf(botY - (botY - topY) * 0.55, 28, 60);
    leaf(botY - (botY - topY) * 0.8, -22, 48);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Campo etiquetado ──────────────────────────────────────────────────────

/// Etiqueta UPPERCASE con tracking sobre el campo de entrada.
class GemsLabeledField extends StatelessWidget {
  const GemsLabeledField({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.8,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}

/// Indicador de pasos: dot activo = pill horizontal; inactivos = círculos.
class GemsStepIndicator extends StatelessWidget {
  const GemsStepIndicator({
    super.key,
    required this.activeIndex,
    this.count = 2,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: active ? 18 : 7,
          height: 7,
          decoration: BoxDecoration(
            color: active
                ? AppColors.primary
                : AppColors.semilleroViolet,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
