import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';

/// Etiqueta: verde oscuro base; una letra a la vez pasa a azul claro.
class AnimatedSemilleroLabel extends StatefulWidget {
  const AnimatedSemilleroLabel({
    super.key,
    this.text = 'un proyecto de',
  });

  final String text;

  @override
  State<AnimatedSemilleroLabel> createState() => _AnimatedSemilleroLabelState();
}

class _AnimatedSemilleroLabelState extends State<AnimatedSemilleroLabel>
    with SingleTickerProviderStateMixin {
  static const Color _baseColor = AppColors.semilleroDarkGreen;
  static const Color _highlightColor = AppColors.semilleroSkyBlue;

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 220 * widget.text.length),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _colorForIndex(int index, int length) {
    if (length <= 1) return _highlightColor;

    final active = (_controller.value * length).floor() % length;
    return index == active ? _highlightColor : _baseColor;
  }

  @override
  Widget build(BuildContext context) {
    final chars = widget.text.characters.toList();
    final baseStyle = AppStyles.subtitle.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    );

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Text.rich(
          textAlign: TextAlign.left,
          TextSpan(
            children: [
              for (var i = 0; i < chars.length; i++)
                TextSpan(
                  text: chars[i],
                  style: baseStyle.copyWith(
                    color: _colorForIndex(i, chars.length),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
