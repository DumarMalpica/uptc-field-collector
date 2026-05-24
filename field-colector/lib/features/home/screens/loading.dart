import 'package:field_colector/features/branding/widgets/citesa_branding_block.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.semilleroInk,
              AppColors.semilleroDarkGreen,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: CitesaBrandingBlock(),
                  ),
                  const SizedBox(height: 32),
                  const CircularProgressIndicator(
                    color: AppColors.semilleroLightGreen,
                    strokeWidth: 2.5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
