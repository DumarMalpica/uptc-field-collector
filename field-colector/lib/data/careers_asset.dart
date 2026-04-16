import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

const String careersAssetPath = 'assets/data/careers.json';

Future<List<String>> loadCareers() async {
  final raw = await rootBundle.loadString(careersAssetPath);
  final decoded = jsonDecode(raw) as List<dynamic>;
  return decoded.map((e) => e as String).toList();
}
