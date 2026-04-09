import 'package:finance_pro/features/home/domain/entities/home_content.dart';
import 'package:finance_pro/features/home/domain/repositories/home_repository.dart';

class LoadHomeContent {
  const LoadHomeContent(this._repository);

  final HomeRepository _repository;

  Future<HomeContent> call({required String localeCode}) {
    return _repository.load(localeCode: localeCode);
  }
}
