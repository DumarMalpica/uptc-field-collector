import 'package:field_colector/data/careers_asset.dart';
import 'package:field_colector/domain/mappers/register_user_dto_builder.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

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

  void _onFormEdited() => setState(() {});

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
    return confirm.isNotEmpty &&
        _passwordController.text != confirm;
  }

  bool _canSubmit() {
    final first = _firstNameController.text.trim();
    final last = _lastNameController.text.trim();
    final mail = _emailController.text.trim();
    final pwd = _passwordController.text;
    final confirm = _confirmPasswordController.text;
    if (first.isEmpty || last.isEmpty || mail.isEmpty) return false;
    if (pwd.isEmpty || confirm.isEmpty || pwd != confirm) return false;
    if (_userType == null) return false;
    final area = _studyArea?.trim();
    if (area == null || area.isEmpty) return false;
    if (area == 'Otra' && (_otherCareer?.trim().isEmpty ?? true)) {
      return false;
    }
    return true;
  }

  void _onRegisterPressed() {
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
    _submitRegistration(dto);
  }

  void _submitRegistration(RegisterUserDto dto) {
    // TODO: call Firebase (or repository) with [dto].
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
          controller: _firstNameController,
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
                  label: const Text('Área de estudio'),
                  dropdownMenuEntries: careers.map((c) {
                    return DropdownMenuEntry(value: c, label: c);
                  }).toList(),
                  onSelected: (v) => setState(() => _studyArea = v),
                  width: double.infinity,
                ),
                if (_studyArea == 'Otra')
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Especifica tu carrera',
                        hintText: 'Ingresa tu carrera',
                      ),
                      onChanged: (v) => setState(() => _otherCareer = v),
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
            enabledBorder: _confirmPasswordMismatch()
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                      width: 1.5,
                    ),
                  )
                : null,
            focusedBorder: _confirmPasswordMismatch()
                ? OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: AppColors.error,
                      width: 2,
                    ),
                  )
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
          onPressed: _canSubmit() ? _onRegisterPressed : null,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryDark,
            side: const BorderSide(color: AppColors.primaryDark),
          ),
          child: const Text('Registrarse'),
        ),
      ],
    );
  }
}
