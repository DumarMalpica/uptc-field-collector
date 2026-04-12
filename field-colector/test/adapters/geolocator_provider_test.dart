import 'package:field_colector/adapters/geolocator_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  late GeolocatorPlatform savedPlatform;

  setUpAll(() {
    savedPlatform = GeolocatorPlatform.instance;
  });

  tearDown(() {
    GeolocatorPlatform.instance = savedPlatform;
  });

  group('GeolocatorProvider', () {
    test('getCurrentLocation maps platform Position to Coordinate', () async {
      GeolocatorPlatform.instance = _TestGeolocatorPlatform(
        position: _samplePosition(
          latitude: -33.4489,
          longitude: -70.6693,
          altitude: 540.0,
          accuracy: 12.5,
        ),
      );

      final sut = GeolocatorProvider();
      final c = await sut.getCurrentLocation();

      expect(c.latitude, -33.4489);
      expect(c.longitude, -70.6693);
      expect(c.altitude, 540.0);
      expect(c.gpsAccuracy, 12.5);
      expect(c.manuallyEdited, false);
    });

    group('checkLocationPermissions', () {
      test('returns true when permission is whileInUse', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.whileInUse,
        );
        expect(await GeolocatorProvider().checkLocationPermissions(), isTrue);
      });

      test('returns true when permission is always', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.always,
        );
        expect(await GeolocatorProvider().checkLocationPermissions(), isTrue);
      });

      test('returns false when permission is denied', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.denied,
        );
        expect(await GeolocatorProvider().checkLocationPermissions(), isFalse);
      });

      test('returns false when permission is deniedForever', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.deniedForever,
        );
        expect(await GeolocatorProvider().checkLocationPermissions(), isFalse);
      });
    });

    test('isLocationEnabled returns platform value', () async {
      GeolocatorPlatform.instance = _TestGeolocatorPlatform(
        isLocationServiceEnabledResult: false,
      );
      expect(await GeolocatorProvider().isLocationEnabled(), isFalse);

      GeolocatorPlatform.instance = _TestGeolocatorPlatform(
        isLocationServiceEnabledResult: true,
      );
      expect(await GeolocatorProvider().isLocationEnabled(), isTrue);
    });

    group('requestLocationPermissions', () {
      test('requests permission when denied and returns true if granted', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.denied,
          requestPermissionResult: LocationPermission.whileInUse,
        );
        expect(await GeolocatorProvider().requestLocationPermissions(), isTrue);
      });

      test('returns false when still denied after request', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.denied,
          requestPermissionResult: LocationPermission.denied,
        );
        expect(await GeolocatorProvider().requestLocationPermissions(), isFalse);
      });

      test('does not change outcome when already deniedForever', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.deniedForever,
          requestPermissionResult: LocationPermission.whileInUse,
        );
        expect(await GeolocatorProvider().requestLocationPermissions(), isFalse);
      });

      test('returns true when already granted', () async {
        GeolocatorPlatform.instance = _TestGeolocatorPlatform(
          checkPermissionResult: LocationPermission.whileInUse,
        );
        expect(await GeolocatorProvider().requestLocationPermissions(), isTrue);
      });
    });
  });
}

Position _samplePosition({
  required double latitude,
  required double longitude,
  required double altitude,
  required double accuracy,
}) {
  return Position(
    latitude: latitude,
    longitude: longitude,
    timestamp: DateTime.utc(2026, 4, 11, 12),
    accuracy: accuracy,
    altitude: altitude,
    altitudeAccuracy: 0,
    heading: 0,
    headingAccuracy: 0,
    speed: 0,
    speedAccuracy: 0,
  );
}

class _TestGeolocatorPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements GeolocatorPlatform {
  _TestGeolocatorPlatform({
    this.checkPermissionResult = LocationPermission.whileInUse,
    this.requestPermissionResult = LocationPermission.whileInUse,
    this.isLocationServiceEnabledResult = true,
    Position? position,
  }) : position = position ??
            _samplePosition(
              latitude: 0,
              longitude: 0,
              altitude: 0,
              accuracy: 0,
            );

  final LocationPermission checkPermissionResult;
  final LocationPermission requestPermissionResult;
  final bool isLocationServiceEnabledResult;
  final Position position;

  @override
  Future<LocationPermission> checkPermission() async => checkPermissionResult;

  @override
  Future<LocationPermission> requestPermission() async =>
      requestPermissionResult;

  @override
  Future<bool> isLocationServiceEnabled() async =>
      isLocationServiceEnabledResult;

  @override
  Future<Position> getCurrentPosition({
    LocationSettings? locationSettings,
  }) async =>
      position;

  @override
  Stream<ServiceStatus> getServiceStatusStream() {
    return super.noSuchMethod(
      Invocation.method(#getServiceStatusStream, []),
      returnValue: Stream<ServiceStatus>.empty(),
    );
  }

  @override
  Stream<Position> getPositionStream({
    LocationSettings? locationSettings,
  }) {
    return super.noSuchMethod(
      Invocation.method(#getPositionStream, [], {#locationSettings: locationSettings}),
      returnValue: Stream<Position>.empty(),
    );
  }

  @override
  Future<Position?> getLastKnownPosition({
    bool forceLocationManager = false,
  }) async =>
      position;

  @override
  Future<LocationAccuracyStatus> getLocationAccuracy() async =>
      LocationAccuracyStatus.unknown;

  @override
  Future<LocationAccuracyStatus> requestTemporaryFullAccuracy({
    required String purposeKey,
  }) async =>
      LocationAccuracyStatus.unknown;

  @override
  Future<bool> openAppSettings() async => false;

  @override
  Future<bool> openLocationSettings() async => false;
}
