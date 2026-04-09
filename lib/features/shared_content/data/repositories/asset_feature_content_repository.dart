import 'package:finance_pro/core/content/asset_json_loader.dart';
import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';

class AssetFeatureContentRepository implements FeatureContentRepository {
  const AssetFeatureContentRepository({required this.loader});

  final AssetJsonLoader loader;

  @override
  Future<FeatureContent> load({
    required String localeCode,
    required String featureId,
  }) async {
    final Map<String, dynamic> json = await loader.loadMap(
      'assets/content/$localeCode/$featureId.json',
    );
    return FeatureContent.fromJson(json);
  }
}
