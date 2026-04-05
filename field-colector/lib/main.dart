import 'package:field_colector/features/auth/providers/auth_provider.dart';
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
    return ChangeNotifierProvider(
      create: (_) => Authprovider(),
      child: MaterialApp(
        title: 'Citesa Field Colector',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
