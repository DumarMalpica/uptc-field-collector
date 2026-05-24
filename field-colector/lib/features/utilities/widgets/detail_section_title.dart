import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DetailSectionTitle extends StatelessWidget {
  const DetailSectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AppColors.primaryDark,
        letterSpacing: 0.3,
      ),
    );
  }
}
