import 'package:field_colector/adapters/fake/fake_auth_adapter.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/home/screens/home.dart';
import 'package:field_colector/features/map/map_services.dart';
import 'package:field_colector/features/utilities/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_tile_caching/flutter_map_tile_caching.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FMTCObjectBoxBackend().initialise();

  final mapServices = MapServices.create();

  runApp(MyApp(mapServices: mapServices));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.mapServices});

  final MapServices mapServices;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Authprovider(authPort: FakeAuthAdapter()),
        ),
        Provider<MapServices>.value(value: mapServices),
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
