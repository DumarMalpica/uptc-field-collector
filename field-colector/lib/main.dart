import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/adapters/fake/fake_auth_adapter.dart';
import 'package:field_colector/features/home/screens/home.dart';
import 'package:field_colector/features/utilities/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Authprovider(authPort: FakeAuthAdapter()),
        ),
      ],
      child: MaterialApp(
        title: 'Citesa Field Colector',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
