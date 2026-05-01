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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:field_colector/domain/ports/bird_record_remote_port.dart';
import 'package:field_colector/domain/ports/outing_remote_port.dart';
import 'package:field_colector/domain/ports/rock_record_remote_port.dart';
import 'package:field_colector/domain/ports/soil_record_remote_port.dart';
import 'package:field_colector/domain/ports/species_remote_port.dart';
import 'package:field_colector/domain/ports/user_remote_port.dart';
import 'package:field_colector/domain/ports/vegetation_record_remote_port.dart';
import 'package:field_colector/domain/ports/water_record_remote_port.dart';

import 'package:field_colector/adapters/real/firebase_bird_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_outing_adapter.dart';
import 'package:field_colector/adapters/real/firebase_rock_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_soil_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_species_adapter.dart';
import 'package:field_colector/adapters/real/firebase_user_adapter.dart';
import 'package:field_colector/adapters/real/firebase_vegetation_record_adapter.dart';
import 'package:field_colector/adapters/real/firebase_water_record_adapter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FMTCObjectBoxBackend().initialise();
  await initializeDateFormatting('es');

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

        Provider<BirdRecordRemotePort>(create: (_) => FirebaseBirdRecordAdapter(FirebaseFirestore.instance)),
        Provider<OutingRemotePort>(create: (_) => FirebaseOutingAdapter(FirebaseFirestore.instance)),
        Provider<RockRecordRemotePort>(create: (_) => FirebaseRockRecordAdapter(FirebaseFirestore.instance)),
        Provider<SoilRecordRemotePort>(create: (_) => FirebaseSoilRecordAdapter(FirebaseFirestore.instance)),
        Provider<SpeciesRemotePort>(create: (_) => FirebaseSpeciesAdapter(FirebaseFirestore.instance)),
        Provider<UserRemotePort>(create: (_) => FirebaseUserAdapter(FirebaseFirestore.instance)),
        Provider<VegetationRecordRemotePort>(create: (_) => FirebaseVegetationRecordAdapter(FirebaseFirestore.instance)),
        Provider<WaterRecordRemotePort>(create: (_) => FirebaseWaterRecordAdapter(FirebaseFirestore.instance)),
      ],
      child: MaterialApp(
        title: 'Citesa Field Colector',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('es'),
          Locale('en'),
        ],
        home: const HomeScreen(),
      ),
    );
  }
}