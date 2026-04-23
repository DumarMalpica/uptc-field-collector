import 'package:field_colector/adapters/fake/fake_auth_adapter.dart';
import 'package:field_colector/features/auth/providers/auth_provider.dart';
import 'package:field_colector/features/home/screens/home.dart';
import 'package:field_colector/features/map/map_services.dart';
import 'package:field_colector/features/utilities/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MaterialApp builds', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Authprovider(authPort: FakeAuthAdapter()),
          ),
          Provider<MapServices>.value(value: MapServices.create()),
        ],
        child: MaterialApp(
          title: 'Citesa Field Colector',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const HomeScreen(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
