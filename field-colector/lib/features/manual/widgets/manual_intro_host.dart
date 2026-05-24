import 'dart:async';

import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/manual/manual_navigation.dart';
import 'package:field_colector/features/manual/providers/manual_intro_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Muestra el diálogo de consentimiento del manual sin alterar el árbol del dashboard.
class ManualIntroHost extends StatefulWidget {
  const ManualIntroHost({super.key, required this.child});

  final Widget child;

  @override
  State<ManualIntroHost> createState() => _ManualIntroHostState();
}

class _ManualIntroHostState extends State<ManualIntroHost> {
  String? _promptShownForUserId;
  bool _dialogInFlight = false;

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Authprovider>();
    context.watch<ManualIntroProvider>();

    if (!auth.isAuthenticated || auth.isLoading) {
      _promptShownForUserId = null;
      return widget.child;
    }

    final userId = auth.user?.id;
    if (userId == null || userId.isEmpty) {
      return widget.child;
    }

    if (_promptShownForUserId != userId && !_dialogInFlight) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(_maybeShowPrompt(userId));
      });
    }

    return widget.child;
  }

  Future<void> _maybeShowPrompt(String userId) async {
    if (!mounted || _dialogInFlight) return;
    if (_promptShownForUserId == userId) return;

    final auth = context.read<Authprovider>();
    if (auth.isLoading || !auth.isAuthenticated || auth.user?.id != userId) {
      return;
    }

    final intro = context.read<ManualIntroProvider>();
    await intro.ensureLoaded();
    if (!mounted) return;
    if (!intro.shouldPrompt(userId)) return;

    _dialogInFlight = true;
    _promptShownForUserId = userId;

    final choice = await _showConsentDialog();
    if (!mounted) return;
    _dialogInFlight = false;

    final resolved = choice ?? ManualIntroChoice.dismiss;
    final openManual = await intro.applyChoice(userId, resolved);
    if (!mounted) return;

    if (openManual) {
      openUserManual(context);
    }
  }

  Future<ManualIntroChoice?> _showConsentDialog() {
    return showDialog<ManualIntroChoice>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Manual de usuario'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('¿Quieres ver la guía de uso ahora?'),
            SizedBox(height: 12),
            Text(
              'También puedes abrirlo cuando quieras en Configuración → '
              'Ayuda y soporte → Manual de usuario.',
              style: TextStyle(fontSize: 13),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(ctx).pop(ManualIntroChoice.dismiss),
            child: const Text('Ahora no'),
          ),
          TextButton(
            onPressed: () =>
                Navigator.of(ctx).pop(ManualIntroChoice.onceOnly),
            child: const Text('Solo esta vez'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.of(ctx).pop(ManualIntroChoice.onLaunch),
            child: const Text('Mostrar al iniciar'),
          ),
        ],
      ),
    );
  }
}
