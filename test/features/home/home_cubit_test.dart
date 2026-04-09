import 'package:finance_pro/features/home/domain/entities/home_content.dart';
import 'package:finance_pro/features/home/domain/repositories/home_repository.dart';
import 'package:finance_pro/features/home/domain/usecases/load_home_content.dart';
import 'package:finance_pro/features/home/presentation/cubit/home_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeHomeRepository implements HomeRepository {
  @override
  Future<HomeContent> load({required String localeCode}) async {
    return const HomeContent(
      eyebrow: 'Test',
      title: 'Fake home',
      summary: 'Summary',
      modules: <HomeModuleSummary>[
        HomeModuleSummary(
          id: 'bonds',
          accent: 'blue',
          kicker: 'Debt',
          title: 'Bonds',
          summary: 'Module summary',
        ),
      ],
    );
  }
}

void main() {
  test('HomeCubit loads content successfully', () async {
    final HomeCubit cubit = HomeCubit(
      LoadHomeContent(_FakeHomeRepository()),
    );

    await cubit.load('es');

    expect(cubit.state.content, isNotNull);
    expect(cubit.state.content!.modules.first.id, 'bonds');
    await cubit.close();
  });
}
