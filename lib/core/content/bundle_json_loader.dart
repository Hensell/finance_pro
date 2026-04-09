import 'dart:convert';

import 'package:finance_pro/core/content/asset_json_loader.dart';
import 'package:flutter/services.dart';

class BundleJsonLoader implements AssetJsonLoader {
  @override
  Future<Map<String, dynamic>> loadMap(String assetPath) async {
    final String raw = await rootBundle.loadString(assetPath);
    return json.decode(raw) as Map<String, dynamic>;
  }
}
