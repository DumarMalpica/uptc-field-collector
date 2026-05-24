import 'package:field_colector/features/manual/screens/user_manual_screen.dart';
import 'package:flutter/material.dart';

/// Abre el manual de usuario a pantalla completa.
void openUserManual(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (_) => const UserManualScreen(),
    ),
  );
}
