abstract interface class AssetJsonLoader {
  Future<Map<String, dynamic>> loadMap(String assetPath);
}
