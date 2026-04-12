import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  final Animation<double> animation;

  const LoginForm({super.key, required this.animation});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  bool _obscurePass = true;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _userController.addListener(() => setState(() => _errorMessage = null));
    _passController.addListener(() => setState(() => _errorMessage = null));
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
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


  Future<void> _handleLogin(BuildContext context) async {
    final auth = context.read<Authprovider>();
    final user = _userController.text.trim();
    final pass = _passController.text.trim();

    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final ok = await auth.loginMock(user, pass);
    if (!mounted) return;
    setState(() => _isLoading = false);

    if (!ok) {
      setState(() => _errorMessage = auth.errorMessage ?? 'Error al ingresar');
    }
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
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _staggered(
          1,
          TextField(
            controller: _passController,
            obscureText: _obscurePass,
            decoration: InputDecoration(
              labelText: 'Contraseña',
              suffixIcon: IconButton(
                icon: Icon(_obscurePass
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined),
                onPressed: () => setState(() => _obscurePass = !_obscurePass),
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
              onPressed: _isLoading ? null : () => _handleLogin(context),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primaryDark,
                side: const BorderSide(color: AppColors.primaryDark),
              ),
              child: _isLoading
                  ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Text('Ingresar'),
            ),
          ),
        ),
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
              textAlign: TextAlign.center,
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
