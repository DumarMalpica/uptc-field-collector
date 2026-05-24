import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/auth/widgets/login_form.dart';
import 'package:field_colector/features/auth/widgets/register_form.dart';
import 'package:field_colector/features/auth/widgets/welcome_section.dart';
import 'package:field_colector/features/utilities/theme/app_colors.dart';
import 'package:field_colector/features/utilities/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum _LoginZone { welcome, login, register }

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  _LoginZone _zone = _LoginZone.welcome;

  late final AnimationController _zoneController;
  late final Animation<double> _curveT;
  late final AnimationController _formController;
  late final AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();

    _zoneController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _curveT = CurvedAnimation(
      parent: _zoneController,
      curve: Curves.easeInOutCubic,
    );

    _formController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _shimmerController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
  }

  @override
  void dispose() {
    _zoneController.dispose();
    _formController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  bool get _isFormZone =>
      _zone == _LoginZone.login || _zone == _LoginZone.register;

  void _switchTo(_LoginZone zone) {
    if (zone == _zone) return;
    final prev = _zone;
    if ((prev == _LoginZone.login && zone == _LoginZone.register) ||
        (prev == _LoginZone.register && zone == _LoginZone.login)) {
      context.read<Authprovider>().clearAuthFormError();
    }
    final wasForm = _isFormZone;
    setState(() => _zone = zone);

    if (zone == _LoginZone.login || zone == _LoginZone.register) {
      if (!wasForm) _zoneController.forward();
      _formController.forward(from: 0);
    } else {
      _zoneController.reverse();
      _formController.reverse();
    }
  }

  // ── Build ──────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: AnimatedBuilder(
        animation: _curveT,
        builder: (context, _) => Stack(
          children: [
            _formBackground(),
            _beigeCurvedPanel(),
            _citesaShimmer(),
            _appName(),
            _welcomeContent(),
            _loginContent(),
            _registerContent(),
            _zoneToggle(),
          ],
        ),
      ),
    );
  }

  // ── Layers ─────────────────────────────────────────────

  Widget _formBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.primary,
            Color.lerp(AppColors.primary, AppColors.primaryDark, 0.25)!,
          ],
        ),
      ),
    );
  }

  Widget _beigeCurvedPanel() {
    return ClipPath(
      clipper: _CurveClipper(_curveT.value),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.authBeige,
              Color.lerp(AppColors.authBeige, AppColors.accent, 0.12)!,
            ],
          ),
        ),
      ),
    );
  }

  Widget _citesaShimmer() {
    return Positioned(
      left: 4,
      top: 0,
      bottom: 0,
      child: IgnorePointer(
        child: AnimatedOpacity(
          opacity: _isFormZone ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 400),
          child: Center(
            child: RotatedBox(
              quarterTurns: 3,
              child: AnimatedBuilder(
                animation: _shimmerController,
                builder: (context, child) => ShaderMask(
                  shaderCallback: (bounds) {
                    final dx = _shimmerController.value * 3 - 1;
                    return LinearGradient(
                      begin: Alignment(dx - 0.3, 0),
                      end: Alignment(dx + 0.3, 0),
                      colors: const [
                        AppColors.authBeige,
                        AppColors.accent,
                        AppColors.authBeige,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ).createShader(bounds);
                  },
                  blendMode: BlendMode.srcIn,
                  child: child,
                ),
                child: Text(
                  'CITESA',
                  style: AppStyles.title.copyWith(
                    letterSpacing: 42,
                    fontSize: 38,
                    color: AppColors.authBeige,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _appName() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AnimatedBuilder(
            animation: _curveT,
            builder: (context, child) {
              final onBeige = _curveT.value < 0.5;
              return Text(
                'FIELD COLECTOR',
                style: AppStyles.title.copyWith(
                  letterSpacing: 10,
                  color: onBeige ? AppColors.primaryDark : AppColors.accent,
                  fontSize: 20,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _welcomeContent() {
    return IgnorePointer(
      ignoring: _zone != _LoginZone.welcome,
      child: AnimatedOpacity(
        opacity: _zone == _LoginZone.welcome ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: const SizedBox(
                width: double.infinity,
                child: WelcomeSection(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginContent() {
    return IgnorePointer(
      ignoring: _zone != _LoginZone.login,
      child: AnimatedOpacity(
        opacity: _zone == _LoginZone.login ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: SafeArea(
          child: Align(
            alignment: const Alignment(-0.1, 0.35),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 56, right: 40),
              child: LoginForm(animation: _formController),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerContent() {
    return IgnorePointer(
      ignoring: _zone != _LoginZone.register,
      child: AnimatedOpacity(
        opacity: _zone == _LoginZone.register ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: SafeArea(
          child: Align(
            alignment: const Alignment(0, 0.1),
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 56, right: 40),
              child: const RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _zoneToggle() {
    if (_zone == _LoginZone.welcome) {
      return Positioned(
        bottom: 24,
        left: 32,
        right: 32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => _switchTo(_LoginZone.register),
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.accent.withValues(alpha: 0.7),
                    size: 20,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'Registrarse',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.primaryDark),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _switchTo(_LoginZone.login),
              behavior: HitTestBehavior.opaque,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ingresar',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.primaryDark),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.accent.withValues(alpha: 0.7),
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Pequeño control arriba-izq. El rect 25% opaco robaba taps a campos (p. ej. con teclado).
    return Positioned(
      top: 0,
      left: 0,
      child: SafeArea(
        child: IconButton(
          tooltip: 'Inicio',
          style: IconButton.styleFrom(
            foregroundColor: AppColors.accent.withValues(alpha: 0.95),
          ),
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => _switchTo(_LoginZone.welcome),
        ),
      ),
    );
  }
}

// ── Animated curve clipper ─────────────────────────────────

class _CurveClipper extends CustomClipper<Path> {
  final double t; // 0 = welcome (beige big), 1 = form (green big)
  _CurveClipper(this.t);

  double _lerp(double welcome, double form) => welcome + (form - welcome) * t;

  @override
  Path getClip(Size size) {
    final leftY = size.height * _lerp(0.85, 0.02);
    final ctrlX = size.width * 0.25;
    final ctrlY = size.height * _lerp(0.92, 0.18);
    final rightY = size.height * _lerp(0.98, 0.30);

    return Path()
      ..lineTo(0, leftY)
      ..quadraticBezierTo(ctrlX, ctrlY, size.width, rightY)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant _CurveClipper old) => old.t != t;
}
