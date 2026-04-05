import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final Animation<double> animation;

  const LoginForm({super.key, required this.animation});

  Widget _staggered(int index, Widget child) {
    final start = index * 0.2;
    final end = (start + 0.4).clamp(0.0, 1.0);
    final curved = CurvedAnimation(
      parent: animation,
      curve: Interval(start, end, curve: Curves.easeOut),
    );
    return FadeTransition(
      opacity: curved,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(curved),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _staggered(
          0,
          const TextField(
            decoration: InputDecoration(
              labelText: 'Usuario',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _staggered(
          1,
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              suffixIcon: Icon(Icons.visibility_off_outlined),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _staggered(
          2,
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryDark,
                side: const BorderSide(color: AppColors.primaryDark),
              ),
              child: const Text('Ingresar'),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _staggered(
          3,
          TextButton(
            onPressed: () {},
            child: Text(
              '¿Olvidaste tu contraseña?',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.primaryDark,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
