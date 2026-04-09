import 'package:finance_pro/core/content/asset_json_loader.dart';
import 'package:finance_pro/core/content/bundle_json_loader.dart';
import 'package:finance_pro/features/bonds/domain/usecases/calculate_bond_value.dart';
import 'package:finance_pro/features/bonds/domain/validators/bond_input_validator.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/calculate_financial_ratios.dart';
import 'package:finance_pro/features/financial_ratios/domain/usecases/derive_financial_statements.dart';
import 'package:finance_pro/features/financial_ratios/domain/validators/financial_ratios_input_validator.dart';
import 'package:finance_pro/features/home/data/repositories/asset_home_repository.dart';
import 'package:finance_pro/features/home/domain/repositories/home_repository.dart';
import 'package:finance_pro/features/home/domain/usecases/load_home_content.dart';
import 'package:finance_pro/features/lease/domain/usecases/calculate_lease_comparison.dart';
import 'package:finance_pro/features/lease/domain/validators/lease_input_validator.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_financial_leverage.dart';
import 'package:finance_pro/features/leverage/domain/usecases/calculate_operating_leverage.dart';
import 'package:finance_pro/features/leverage/domain/validators/leverage_input_validator.dart';
import 'package:finance_pro/features/shared_content/data/repositories/asset_feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/repositories/feature_content_repository.dart';
import 'package:finance_pro/features/shared_content/domain/usecases/load_feature_content.dart';
import 'package:finance_pro/features/shares/domain/usecases/calculate_share_valuation.dart';
import 'package:finance_pro/features/shares/domain/validators/share_input_validator.dart';

class AppDependencies {
  const AppDependencies({
    required this.homeRepository,
    required this.featureContentRepository,
    required this.loadHomeContent,
    required this.loadFeatureContent,
    required this.calculateBondValue,
    required this.bondInputValidator,
    required this.calculateShareValuation,
    required this.shareInputValidator,
    required this.calculateOperatingLeverage,
    required this.calculateFinancialLeverage,
    required this.leverageInputValidator,
    required this.calculateLeaseComparison,
    required this.leaseInputValidator,
    required this.calculateFinancialRatios,
    required this.deriveFinancialStatements,
    required this.financialRatiosInputValidator,
  });

  factory AppDependencies.create() {
    final AssetJsonLoader loader = BundleJsonLoader();
    final HomeRepository homeRepository = AssetHomeRepository(loader: loader);
    final FeatureContentRepository featureContentRepository =
        AssetFeatureContentRepository(loader: loader);
    const DeriveFinancialStatements deriveFinancialStatements =
        DeriveFinancialStatements();

    return AppDependencies(
      homeRepository: homeRepository,
      featureContentRepository: featureContentRepository,
      loadHomeContent: LoadHomeContent(homeRepository),
      loadFeatureContent: LoadFeatureContent(featureContentRepository),
      calculateBondValue: const CalculateBondValue(),
      bondInputValidator: const BondInputValidator(),
      calculateShareValuation: const CalculateShareValuation(),
      shareInputValidator: const ShareInputValidator(),
      calculateOperatingLeverage: const CalculateOperatingLeverage(),
      calculateFinancialLeverage: const CalculateFinancialLeverage(),
      leverageInputValidator: const LeverageInputValidator(),
      calculateLeaseComparison: const CalculateLeaseComparison(),
      leaseInputValidator: const LeaseInputValidator(),
      deriveFinancialStatements: deriveFinancialStatements,
      calculateFinancialRatios: const CalculateFinancialRatios(
        deriveFinancialStatements: deriveFinancialStatements,
      ),
      financialRatiosInputValidator: const FinancialRatiosInputValidator(
        deriveFinancialStatements: deriveFinancialStatements,
      ),
    );
  }

  final BondInputValidator bondInputValidator;
  final CalculateBondValue calculateBondValue;
  final CalculateFinancialLeverage calculateFinancialLeverage;
  final CalculateFinancialRatios calculateFinancialRatios;
  final CalculateLeaseComparison calculateLeaseComparison;
  final CalculateOperatingLeverage calculateOperatingLeverage;
  final DeriveFinancialStatements deriveFinancialStatements;
  final CalculateShareValuation calculateShareValuation;
  final FeatureContentRepository featureContentRepository;
  final FinancialRatiosInputValidator financialRatiosInputValidator;
  final HomeRepository homeRepository;
  final LeaseInputValidator leaseInputValidator;
  final LeverageInputValidator leverageInputValidator;
  final LoadFeatureContent loadFeatureContent;
  final LoadHomeContent loadHomeContent;
  final ShareInputValidator shareInputValidator;
}
