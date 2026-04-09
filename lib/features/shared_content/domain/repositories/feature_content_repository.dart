import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';

abstract interface class FeatureContentRepository {
  Future<FeatureContent> load({
    required String localeCode,
    required String featureId,
  });
}
