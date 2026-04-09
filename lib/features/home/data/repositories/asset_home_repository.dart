import 'package:finance_pro/core/content/asset_json_loader.dart';
import 'package:finance_pro/features/home/domain/entities/home_content.dart';
import 'package:finance_pro/features/home/domain/repositories/home_repository.dart';

class AssetHomeRepository implements HomeRepository {
  const AssetHomeRepository({required this.loader});

  final AssetJsonLoader loader;

  @override
  Future<HomeContent> load({required String localeCode}) async {
    final Map<String, dynamic> json = await loader.loadMap(
      'assets/content/$localeCode/home.json',
    );
    return HomeContent.fromJson(json);
  }
}
