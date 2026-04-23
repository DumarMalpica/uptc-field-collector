import 'package:field_colector/adapters/geolocator_provider.dart';
import 'package:field_colector/domain/ports/locator_provider.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/auth/screens/login.dart';
import 'package:field_colector/features/dashboard/screens/dashboard.dart';
import 'package:field_colector/features/home/screens/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final LocatorProvider _locator = GeolocatorProvider();

  @override
  void initState() {
    super.initState();
    final auth = context.read<Authprovider>();
    auth.restoreSession();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Authprovider>(
      builder: (context, auth, _) {
        if (auth.isLoading) {
          return LoadingScreen();
        }

        if (!auth.isAuthenticated) {
          return LoginScreen();
        }

        return DashboardScreen(locator: _locator);
      },
    );
  }
}
