import 'dart:convert';

import 'package:finance_pro/core/content/asset_json_loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class BundleJsonLoader implements AssetJsonLoader {
  @override
  Future<Map<String, dynamic>> loadMap(String assetPath) async {
    final String raw = await rootBundle.loadString(assetPath);
    final dynamic decoded = await compute(_decodeJson, raw);
    return decoded as Map<String, dynamic>;
  }

  static dynamic _decodeJson(String source) => json.decode(source);
}
