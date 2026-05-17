import 'package:field_colector/domain/mappers/login_user.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
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
  bool _isLoggingIn = false;

  bool _fieldsFilled() {
    final mail = _userController.text.trim();
    final pwd = _passwordController.text;
    return mail.isNotEmpty && pwd.isNotEmpty;
  }

  void _onFieldChanged() {
    context.read<Authprovider>().clearAuthFormError();
    setState(() {});
  }

  Future<void> _submit() async {
    if (!_fieldsFilled()) return;
    setState(() => _isLoggingIn = true);
    final auth = context.read<Authprovider>();
    try {
      await auth.login(
        LoginUser(
          email: _userController.text.trim(),
          password: _passwordController.text,
        ),
      );
      if (!mounted) return;
      final err = auth.errorMessage;
      if (err != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(err)));
      }
    } finally {
      if (mounted) setState(() => _isLoggingIn = false);
    }
  }

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
            onChanged: (_) => _onFieldChanged(),
            decoration: const InputDecoration(
              labelText: 'Correo',
              suffixIcon: Icon(Icons.person_outline),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _staggered(
          1,
          TextField(
            controller: _passwordController,
            onChanged: (_) => _onFieldChanged(),
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
              onPressed: _fieldsFilled() && !_isLoggingIn ? _submit : null,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryDark,
                side: const BorderSide(color: AppColors.primaryDark),
              ),
              child: _isLoggingIn
                  ? const SizedBox(
                      height: 22,
                      width: 22,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Ingresar'),
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
