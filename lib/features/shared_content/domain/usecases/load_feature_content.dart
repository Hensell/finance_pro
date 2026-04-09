import 'package:finance_pro/features/shared_content/domain/entities/feature_content.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';

class LoadFeatureContent {
  const LoadFeatureContent(this._repository);

  final FeatureContentRepository _repository;

  Future<FeatureContent> call({
    required String localeCode,
    required String featureId,
  }) {
    return _repository.load(
      localeCode: localeCode,
      featureId: featureId,
    );
  }
}
