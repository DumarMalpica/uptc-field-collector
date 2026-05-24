import 'package:field_colector/data/careers_asset.dart';
import 'package:field_colector/domain/mappers/register_user_dto_builder.dart';
import 'package:field_colector/domain/ports/auth_port.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/auth/theme/auth_form_theme.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

bool _registerEmailOk(String email) =>
    RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email);

class _RegisterFormState extends State<RegisterForm> {
  int? _userType;
  String? _studyArea;
  String? _otherCareer;

  late final Future<List<String>> _careersFuture;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isSubmitting = false;

  void _onFormEdited() {
    context.read<Authprovider>().clearAuthFormError();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _careersFuture = loadCareers();
    for (final c in [
      _firstNameController,
      _lastNameController,
      _emailController,
      _passwordController,
      _confirmPasswordController,
    ]) {
      c.addListener(_onFormEdited);
    }
  }

  @override
  void dispose() {
    for (final c in [
      _firstNameController,
      _lastNameController,
      _emailController,
      _passwordController,
      _confirmPasswordController,
    ]) {
      c.removeListener(_onFormEdited);
    }
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _confirmPasswordMismatch() {
    final confirm = _confirmPasswordController.text;
    return confirm.isNotEmpty && _passwordController.text != confirm;
  }

  bool _canSubmit() {
    final first = _firstNameController.text.trim();
    final last = _lastNameController.text.trim();
    final mail = _emailController.text.trim();
    final pwd = _passwordController.text;
    final confirm = _confirmPasswordController.text;
    if (first.isEmpty || last.isEmpty || mail.isEmpty) return false;
    if (!_registerEmailOk(mail)) return false;
    if (pwd.isEmpty || confirm.isEmpty || pwd != confirm) return false;
    if (_userType == null) return false;
    final area = _studyArea?.trim();
    if (area == null || area.isEmpty) return false;
    if (area == 'Otra' && (_otherCareer?.trim().isEmpty ?? true)) {
      return false;
    }
    return true;
  }

  Future<void> _onRegisterPressed() async {
    final dto = buildRegisterUserDto(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
      userType: _userType,
      studyArea: _studyArea,
      otherCareer: _otherCareer,
    );
    if (dto == null) return;
    await _submitRegistration(dto);
  }

  Future<void> _submitRegistration(RegisterUserDto dto) async {
    setState(() => _isSubmitting = true);
    final auth = context.read<Authprovider>();
    try {
      await auth.register(dto);
      if (!mounted) return;
      if (auth.errorMessage == null && auth.isAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cuenta creada. Bienvenido/a.')),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            context.read<Authprovider>().errorMessage ??
                'No se pudo registrar. Intenta de nuevo.',
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  String? _emailServerErrorText(
    String mailTrim,
    String? errMsg,
    AuthErrorType? errType,
  ) {
    if (errMsg == null || errType == null) return null;
    if (errType == AuthErrorType.invalidEmail ||
        errType == AuthErrorType.emailAlreadyInUse) {
      return errMsg;
    }
    return null;
  }

  String? _generalRegisterError(String? errMsg, AuthErrorType? errType) {
    if (errMsg == null) return null;
    if (errType == AuthErrorType.invalidEmail ||
        errType == AuthErrorType.emailAlreadyInUse) {
      return null;
    }
    return errMsg;
  }

  @override
  Widget build(BuildContext context) {
    final mailTrim = _emailController.text.trim();
    return Selector<Authprovider, (String?, AuthErrorType?)>(
      selector: (_, a) => (a.errorMessage, a.lastAuthError),
      builder: (context, authErr, __) {
        final errMsg = authErr.$1;
        final errType = authErr.$2;
        final emailServerErr = _emailServerErrorText(mailTrim, errMsg, errType);
        final generalErr = _generalRegisterError(errMsg, errType);

        return Theme(
          data: AuthFormTheme.onGreen(Theme.of(context)),
          child: Builder(builder: (ctx) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Regístrate', style: Theme.of(ctx).textTheme.titleLarge),
              AppStyles.gapMd,
              if (generalErr != null) ...[
                Text(
                  generalErr,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppColors.error),
                ),
                AppStyles.gapSm,
              ],
              TextField(
                controller: _firstNameController,
                style: const TextStyle(color: AuthFormTheme.fieldTextColor),
                decoration: AuthFormTheme.fieldDecoration(labelText: 'Nombre'),
              ),
              AppStyles.gapSm,
              TextField(
                controller: _lastNameController,
                style: const TextStyle(color: AuthFormTheme.fieldTextColor),
                decoration: AuthFormTheme.fieldDecoration(
                  labelText: 'Apellido',
                ),
              ),
              AppStyles.gapSm,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: AuthFormTheme.fieldTextColor),
                decoration: AuthFormTheme.fieldDecoration(
                  labelText: 'Correo',
                  errorText: mailTrim.isNotEmpty && !_registerEmailOk(mailTrim)
                      ? 'Correo no válido'
                      : emailServerErr,
                ),
              ),
              AppStyles.gapSm,

              RadioGroup<int>(
                groupValue: _userType,
                onChanged: (v) {
                  context.read<Authprovider>().clearAuthFormError();
                  setState(() => _userType = v);
                },
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
                        title: Text('Profesional'),
                        value: 1,
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                      ),
                    ),
                  ],
                ),
              ),
              AppStyles.gapSm,

              FutureBuilder<List<String>>(
                future: _careersFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }

                  if (snapshot.hasError || snapshot.data == null) {
                    return Text(
                      'Error al cargar carreras',
                      style: TextStyle(color: AppColors.error),
                    );
                  }

                  final careers = snapshot.data!;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownMenu<String>(
                        initialSelection: _studyArea,
                        label: const Text(
                          'Área de estudio',
                          style: TextStyle(color: AuthFormTheme.inputLabelColor),
                        ),
                        dropdownMenuEntries: careers.map((c) {
                          return DropdownMenuEntry(
                            value: c,
                            label: c,
                            style: ButtonStyle(
                              foregroundColor: WidgetStateProperty.all(
                                AuthFormTheme.menuItemTextColor,
                              ),
                            ),
                          );
                        }).toList(),
                        onSelected: (v) {
                          context.read<Authprovider>().clearAuthFormError();
                          setState(() => _studyArea = v);
                        },
                        width: double.infinity,
                      ),
                      if (_studyArea == 'Otra')
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: TextFormField(
                            style: const TextStyle(
                              color: AuthFormTheme.fieldTextColor,
                            ),
                            decoration: AuthFormTheme.fieldDecoration(
                              labelText: 'Especifica tu carrera',
                              hintText: 'Ingresa tu carrera',
                            ),
                            onChanged: (v) {
                              context.read<Authprovider>().clearAuthFormError();
                              setState(() => _otherCareer = v);
                            },
                          ),
                        ),
                    ],
                  );
                },
              ),
              AppStyles.gapSm,

              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(color: AuthFormTheme.fieldTextColor),
                decoration: AuthFormTheme.fieldDecoration(
                  labelText: 'Contraseña',
                  helperText: errType == AuthErrorType.weakPassword
                      ? 'Use al menos 6 caracteres; combine letras y números.'
                      : null,
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
                style: const TextStyle(color: AuthFormTheme.fieldTextColor),
                decoration: AuthFormTheme.fieldDecoration(
                  labelText: 'Confirmar contraseña',
                  errorText: _confirmPasswordMismatch()
                      ? 'Las contraseñas no coinciden'
                      : null,
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
              AppStyles.gapLg,

              OutlinedButton(
                onPressed: _canSubmit() && !_isSubmitting
                    ? _onRegisterPressed
                    : null,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Registrarse'),
              ),
            ],
          )),
        );
      },
    );
  }
}
