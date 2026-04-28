import 'package:field_colector/domain/mappers/login_user.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/domain/entities/role.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.animation});

  final Animation<double> animation;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _userController;
  late final TextEditingController _passwordController;

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget _staggered(int index, Widget child) {
    final start = index * 0.2;
    final end = (start + 0.4).clamp(0.0, 1.0);
    final curved = CurvedAnimation(
      parent: widget.animation,
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
          TextField(
            controller: _userController,
            decoration: const InputDecoration(
              labelText: 'Usuario',
              suffixIcon: Icon(Icons.person_outline),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _staggered(
          1,
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        _staggered(
          2,
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                context.read<Authprovider>().login(
                  LoginUser(
                    email: _userController.text,
                    password: _passwordController.text,
                  ),
                );
              },
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
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.primaryDark),
            ),
          ),
        ),
      ],
    );
  }
}
