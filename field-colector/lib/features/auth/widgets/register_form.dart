import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  int? _userType;
  bool _isLoading = false;
  String? _errorMessage;

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _areaController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() => setState(() => _errorMessage = null));
    _lastNameController.addListener(() => setState(() => _errorMessage = null));
    _emailController.addListener(() => setState(() => _errorMessage = null));
    _passwordController.addListener(() => setState(() => _errorMessage = null));
    _confirmPasswordController.addListener(() => setState(() => _errorMessage = null));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _areaController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister(BuildContext context) async {
    if (_userType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Selecciona un tipo de usuario')),
      );
      return;
    }

    final auth = context.read<Authprovider>();
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final ok = await auth.registerMock(
      userName: '${_nameController.text.trim()} ${_lastNameController.text.trim()}',
      email: _emailController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      role: 'user',
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (!ok) {
      setState(() => _errorMessage = auth.errorMessage ?? 'Error al registrarse');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Regístrate',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.primaryDark),
        ),
        AppStyles.gapMd,
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(labelText: 'Nombre'),
        ),
        AppStyles.gapSm,
        TextField(
          controller: _lastNameController,
          decoration: const InputDecoration(labelText: 'Apellido'),
        ),
        AppStyles.gapSm,
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(labelText: 'Correo'),
        ),
        AppStyles.gapSm,

        RadioGroup<int>(
          groupValue: _userType,
          onChanged: (v) => setState(() => _userType = v),
          child: Row(
            children: const [
              Expanded(
                child: RadioListTile<int>(
                  title: Text('Estudiante'),
                  value: 0,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
              Expanded(
                child: RadioListTile<int>(
                  title: Text('Graduado'),
                  value: 1,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                ),
              ),
            ],
          ),
        ),
        AppStyles.gapSm,

        TextField(
          controller: _areaController,
          decoration: const InputDecoration(labelText: 'Área de estudio'),
        ),
        AppStyles.gapSm,

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
              onPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
          ),
        ),
        AppStyles.gapSm,

        TextField(
          controller: _confirmPasswordController,
          obscureText: _obscureConfirmPassword,
          decoration: InputDecoration(
            labelText: 'Confirmar contraseña',
            suffixIcon: IconButton(
              icon: Icon(
                _obscureConfirmPassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
              onPressed: () => setState(
                () => _obscureConfirmPassword = !_obscureConfirmPassword,
              ),
            ),
          ),
        ),
        AppStyles.gapSm,
        if (_errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              _errorMessage!,
              style: const TextStyle(color: Colors.red, fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        AppStyles.gapSm,
        OutlinedButton(
          onPressed: _isLoading ? null : () => _handleRegister(context),
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
              : const Text('Registrarse'),
        ),
      ],
    );
  }
}
