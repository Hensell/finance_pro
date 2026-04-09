// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Finance Pro';

  @override
  String get appTagline =>
      'Corporate finance with clear routes, live formulas, and practical calculators.';

  @override
  String get appPrimaryAction => 'Enter the lab';

  @override
  String get appSecondaryAction => 'Go to home';

  @override
  String get appExploreAction => 'Explore module';

  @override
  String get appReadTopicAction => 'Read topic';

  @override
  String get appOpenCalculatorAction => 'Open calculator';

  @override
  String get appRetryAction => 'Retry';

  @override
  String get appBackAction => 'Back';

  @override
  String get appBackHomeAction => 'Back to home';

  @override
  String get appToggleLanguageLabel => 'Language';

  @override
  String get appSpanishLabel => 'Spanish';

  @override
  String get appEnglishLabel => 'English';

  @override
  String get appLoadingTitle => 'Loading content';

  @override
  String get appLoadingBody => 'Preparing modules, formulas, and calculators.';

  @override
  String get appSplashLabel => 'Preparing the finance lab.';

  @override
  String get appErrorTitle => 'We could not load this view';

  @override
  String get appErrorBody => 'Check the local content and try again.';

  @override
  String get appEmptyTitle => 'No content available';

  @override
  String get appEmptyBody => 'This module does not have published content yet.';

  @override
  String get appTopicsSection => 'Available topics';

  @override
  String get appHighlightsSection => 'Why study this module';

  @override
  String get appCalculatorSection => 'Calculator';

  @override
  String get appResultsSection => 'Results';

  @override
  String get appFormulaSection => 'Formulas';

  @override
  String get appExamplesSection => 'Examples';

  @override
  String get appInputsSection => 'Inputs';

  @override
  String get appTopicSection => 'Topic';

  @override
  String get appFooterPrimary =>
      'Clean architecture, localizable content, and design system components.';

  @override
  String get appFooterSecondary =>
      'Built for web and ready to scale by feature.';

  @override
  String get appFooterCreditsPrefix => 'Credits:';

  @override
  String get appFooterCreditsName => 'Hensell';

  @override
  String get appFooterCreditsLinkLabel => 'hensell.dev';

  @override
  String get appNumericHint => '0.0';

  @override
  String get shellModulesLabel => 'Modules';

  @override
  String get validationPositiveNumbers =>
      'Enter valid positive values in all required fields.';

  @override
  String get validationWholeYearsRequired =>
      'Years to maturity must be a positive whole number.';

  @override
  String get validationNonNegativeNumbers => 'Enter valid non-negative values.';

  @override
  String get bondCalculatorGuideTitle => 'How to approach this calculation';

  @override
  String get bondCalculatorGuideStepCashTitle =>
      '1. Identify the bond cash flows';

  @override
  String get bondCalculatorGuideStepCashBody =>
      'First identify how much the bond pays each year and how much it returns at maturity.';

  @override
  String get bondCalculatorGuideStepMarketTitle =>
      '2. Define time and market rate';

  @override
  String get bondCalculatorGuideStepMarketBody =>
      'Then determine how many years are left and what return investors demand.';

  @override
  String get bondCalculatorGuideStepDecisionTitle => '3. Interpret the price';

  @override
  String get bondCalculatorGuideStepDecisionBody =>
      'Finally compare the estimated price with par value to tell whether the bond trades at a premium, discount, or near par.';

  @override
  String get bondCalculatorLiveFormulaLabel => 'Live substitution';

  @override
  String get bondCalculatorLiveFormulaSummary =>
      'The formula updates with your values while you complete the exercise.';

  @override
  String get bondCalculatorInterpretationTitle => 'How to read the result';

  @override
  String get bondCalculatorStatusLabel => 'Bond position';

  @override
  String get bondCalculatorStatusPremium => 'Premium';

  @override
  String get bondCalculatorStatusAtPar => 'Near par';

  @override
  String get bondCalculatorStatusDiscount => 'Discount';

  @override
  String get bondCalculatorCouponRateLabel => 'Implied coupon rate';

  @override
  String get bondCalculatorDifferenceLabel => 'Difference vs par';

  @override
  String bondCalculatorPremiumExplanation(
    Object couponRate,
    Object requiredReturn,
  ) {
    return 'The bond trades at a premium because the implied coupon rate ($couponRate%) is above the required return ($requiredReturn%). That pushes the price above par value.';
  }

  @override
  String bondCalculatorAtParExplanation(
    Object couponRate,
    Object requiredReturn,
  ) {
    return 'The bond stays near par because the implied coupon rate ($couponRate%) is very close to the required return ($requiredReturn%).';
  }

  @override
  String bondCalculatorDiscountExplanation(
    Object couponRate,
    Object requiredReturn,
  ) {
    return 'The bond trades at a discount because the implied coupon rate ($couponRate%) stays below the required return ($requiredReturn%). That pulls the price below par value.';
  }

  @override
  String get shareCalculatorGuideTitle => 'How to approach this model';

  @override
  String get shareCalculatorGuideStepModelTitle => '1. Choose the right model';

  @override
  String get shareCalculatorGuideStepModelBody =>
      'First decide whether the problem uses zero growth, constant growth, two growth stages, or a preferred share.';

  @override
  String get shareCalculatorGuideStepDividendTitle =>
      '2. Identify which dividend the model uses';

  @override
  String get shareCalculatorGuideStepDividendBody =>
      'You do not always enter the same cash flow: some modes start from D₁, others from D₀, and preferred shares use D.';

  @override
  String get shareCalculatorGuideStepInterpretTitle => '3. Interpret the price';

  @override
  String get shareCalculatorGuideStepInterpretBody =>
      'After calculating, review how growth, required return, and when applicable terminal value shape the estimated price.';

  @override
  String get shareCalculatorModelSectionTitle =>
      'Choose the valuation approach';

  @override
  String get shareCalculatorModelSectionSummary =>
      'Each model answers a different assumption about dividends and growth.';

  @override
  String get shareCalculatorLiveFormulaLabel => 'Live substitution';

  @override
  String get shareCalculatorLiveFormulaSummary =>
      'The formula changes with the active model and updates with your values while you type.';

  @override
  String get shareCalculatorInterpretationTitle => 'How to read the result';

  @override
  String get shareCalculatorDividendBasisLabel => 'Dividend used';

  @override
  String get shareCalculatorRequiredReturnLabel => 'Required return';

  @override
  String get shareCalculatorSpreadLabel => 'Valuation spread';

  @override
  String get shareCalculatorTerminalWeightLabel => 'Terminal value weight';

  @override
  String shareCalculatorZeroGrowthExplanation(Object requiredReturn) {
    return 'This model treats the share as a simple perpetuity using D₁ and a required return of $requiredReturn%. It works best when you expect no dividend growth.';
  }

  @override
  String shareCalculatorPreferredExplanation(Object requiredReturn) {
    return 'A preferred share is valued as a perpetuity with a fixed dividend and a required return of $requiredReturn%. The relevant cash flow here is D, not D₀ or D₁.';
  }

  @override
  String shareCalculatorConstantGrowthExplanation(
    Object growthRate,
    Object spread,
  ) {
    return 'Price depends on the spread between k_s and g. With growth at $growthRate% and a spread of $spread%, the Gordon model remains valid because k_s stays above g.';
  }

  @override
  String shareCalculatorVariableGrowthExplanation(
    Object periods,
    Object terminalGrowth,
    Object terminalWeight,
  ) {
    return 'The result adds projected dividends for $periods periods and a terminal value computed with g₂ = $terminalGrowth%. In this case, terminal value explains about $terminalWeight% of the estimated price.';
  }

  @override
  String get leverageCalculatorGuideTitle =>
      'How to think through this calculation';

  @override
  String get leverageCalculatorGuideStepModeTitle =>
      '1. Pick the right leverage type';

  @override
  String get leverageCalculatorGuideStepModeBody =>
      'First decide whether the problem is about EBIT sensitivity to sales or common-shareholder sensitivity to EBIT.';

  @override
  String get leverageCalculatorGuideStepBaseTitle =>
      '2. Check the sensitive base';

  @override
  String get leverageCalculatorGuideStepBaseBody =>
      'Then confirm that the denominator base stays positive. When it gets close to zero, risk rises and the degree jumps.';

  @override
  String get leverageCalculatorGuideStepInterpretTitle =>
      '3. Interpret the amplification';

  @override
  String get leverageCalculatorGuideStepInterpretBody =>
      'A degree of 2 does not mean 2 more dollars. It means a 1% change is amplified to roughly 2%.';

  @override
  String get leverageCalculatorModeSectionTitle => 'Choose the leverage type';

  @override
  String get leverageCalculatorModeSectionSummary =>
      'Each mode starts from a different base and reflects a different source of business risk.';

  @override
  String get leverageCalculatorLiveFormulaLabel => 'Live substitution';

  @override
  String get leverageCalculatorLiveFormulaSummary =>
      'The formula updates with your inputs so you can see what enters the numerator and what remains as the sensitive base.';

  @override
  String get leverageCalculatorInterpretationTitle => 'How to read the result';

  @override
  String get leverageCalculatorSensitivityLabel => 'Sensitivity level';

  @override
  String get leverageCalculatorSensitivityMeasured => 'Measured';

  @override
  String get leverageCalculatorSensitivityElevated => 'Elevated';

  @override
  String get leverageCalculatorSensitivityHigh => 'High';

  @override
  String get leverageCalculatorContributionMarginLabel =>
      'Total contribution margin';

  @override
  String get leverageCalculatorEbitLabel => 'Estimated EBIT';

  @override
  String get leverageCalculatorCommonBaseLabel =>
      'Base available to common shareholders';

  @override
  String get leverageCalculatorTaxAdjustedPreferredLabel =>
      'Tax-adjusted preferred dividends';

  @override
  String leverageCalculatorOperatingExplanation(
    Object amplification,
    Object contributionMargin,
    Object ebit,
  ) {
    return 'With a DOL of $amplification, a 1% change in sales would move EBIT by roughly $amplification%. In this exercise, total contribution margin is $contributionMargin and estimated EBIT is $ebit.';
  }

  @override
  String leverageCalculatorFinancialExplanation(
    Object amplification,
    Object commonBase,
    Object taxAdjustedPreferred,
  ) {
    return 'With a DFL of $amplification, a 1% change in EBIT would move earnings available to common shareholders by roughly $amplification%. Here the base available to common shareholders is $commonBase and the tax-adjusted preferred dividend charge is $taxAdjustedPreferred.';
  }

  @override
  String get leaseCalculatorGuideTitle =>
      'How to think through this comparison';

  @override
  String get leaseCalculatorGuideStepLeaseTitle => '1. Compute the lease cost';

  @override
  String get leaseCalculatorGuideStepLeaseBody =>
      'Convert all future lease payments into one present value amount.';

  @override
  String get leaseCalculatorGuideStepBuyTitle =>
      '2. Compute the net cost of buying';

  @override
  String get leaseCalculatorGuideStepBuyBody =>
      'Start with the price today and subtract the discounted residual value so you do not compare cash flows from different dates directly.';

  @override
  String get leaseCalculatorGuideStepDecisionTitle => '3. Compare and decide';

  @override
  String get leaseCalculatorGuideStepDecisionBody =>
      'The alternative with the lower present value is the lower-cost option economically, although the final decision may still consider flexibility or risk.';

  @override
  String get leaseCalculatorLiveFormulaLabel => 'Live substitution';

  @override
  String get leaseCalculatorLiveFormulaSummary =>
      'The comparison updates with your numbers so you can see the lease cost and the net cost of buying at the same time.';

  @override
  String get leaseCalculatorInterpretationTitle => 'How to read the result';

  @override
  String get leaseCalculatorRecommendationLabel => 'Suggested alternative';

  @override
  String get leaseCalculatorRecommendationLease => 'Leasing looks better';

  @override
  String get leaseCalculatorRecommendationBuy => 'Buying looks better';

  @override
  String get leaseCalculatorRecommendationNeutral => 'Very similar result';

  @override
  String get leaseCalculatorDifferenceLabel => 'Relative savings';

  @override
  String get leaseCalculatorResidualBenefitLabel => 'Discounted residual value';

  @override
  String leaseCalculatorLeaseExplanation(
    Object savings,
    Object rate,
    Object residual,
  ) {
    return 'With a discount rate of $rate%, leasing consumes about $savings less present value. The discounted residual value on the purchase option would be $residual, but leasing still remains the lighter economic cost.';
  }

  @override
  String leaseCalculatorBuyExplanation(
    Object savings,
    Object rate,
    Object residual,
  ) {
    return 'With a discount rate of $rate%, buying today is better by about $savings. The discounted residual value recovers roughly $residual, and that pushes the net purchase cost below the lease alternative.';
  }

  @override
  String leaseCalculatorNeutralExplanation(Object rate, Object residual) {
    return 'With a discount rate of $rate% and a discounted residual value near $residual, both alternatives end up very close in present value. The final choice may depend on liquidity, flexibility, or operating risk.';
  }

  @override
  String get validationGrowthLessThanReturn =>
      'Growth rate must be lower than the required return.';

  @override
  String get validationPeriodsRequired =>
      'When using variable growth, periods must be greater than zero.';

  @override
  String get validationLeaseRequiredFields =>
      'Complete the lease payment, periods, rate, purchase price, and residual value with valid numbers.';

  @override
  String get validationLeasePeriodsRequired =>
      'The number of lease periods must be a positive integer.';

  @override
  String get validationLeaseResidualExceedsPrice =>
      'Residual value should not exceed the purchase price in this basic comparison.';

  @override
  String get validationTaxRateRange =>
      'Tax rate must be at least 0 and lower than 100.';

  @override
  String get validationLeverageOperatingDenominator =>
      'Total contribution margin must exceed fixed costs to calculate operating leverage.';

  @override
  String get validationLeverageFinancialDenominator =>
      'Earnings available to common shareholders must be greater than zero to calculate financial leverage.';

  @override
  String get validationRatiosRequired =>
      'Complete all required fields to calculate the financial ratios.';

  @override
  String get financialRatiosContinueAction => 'Continue';

  @override
  String get financialRatiosLoadSampleAction => 'Fill with sample data';

  @override
  String get financialRatiosFormulaFallback =>
      'Select a step or ratio family to see the relevant formulas.';

  @override
  String get financialRatiosStatementPreviewTitle => 'Derived subtotals';

  @override
  String get financialRatiosStatementPreviewSummary =>
      'The builder recalculates these balances each time you change a base line item.';

  @override
  String get financialRatiosBalancePreviewTitle => 'Accounting check';

  @override
  String get financialRatiosBalancePreviewSummary =>
      'Use this block to review the equation and catch inconsistencies before analyzing.';

  @override
  String get financialRatiosNetSalesLabel => 'Net sales';

  @override
  String get financialRatiosNetPurchasesLabel => 'Net purchases';

  @override
  String get financialRatiosCostOfSalesLabel => 'Cost of sales';

  @override
  String get financialRatiosGrossProfitLabel => 'Gross profit';

  @override
  String get financialRatiosOperatingExpensesLabel => 'Operating expenses';

  @override
  String get financialRatiosEbitLabel => 'EBIT';

  @override
  String get financialRatiosEarningsBeforeTaxesLabel => 'Earnings before taxes';

  @override
  String get financialRatiosNetIncomeLabel => 'Net income';

  @override
  String get financialRatiosCurrentAssetsLabel => 'Current assets';

  @override
  String get financialRatiosFixedAssetsNetLabel => 'Net fixed assets';

  @override
  String get financialRatiosTotalAssetsLabel => 'Total assets';

  @override
  String get financialRatiosCurrentLiabilitiesLabel => 'Current liabilities';

  @override
  String get financialRatiosNonCurrentLiabilitiesLabel =>
      'Non-current liabilities';

  @override
  String get financialRatiosTotalLiabilitiesLabel => 'Total liabilities';

  @override
  String get financialRatiosEquityLabel => 'Equity';

  @override
  String get financialRatiosLiabilitiesAndEquityLabel => 'Liabilities + equity';

  @override
  String get financialRatiosBalanceDifferenceLabel => 'Balance difference';

  @override
  String get financialRatiosValidationNumeric =>
      'Enter valid numbers or leave the field empty when the line item is zero.';

  @override
  String get financialRatiosValidationCompleteIncomeStatement =>
      'Complete every income statement line item, even when a value is 0.';

  @override
  String get financialRatiosValidationCompleteBalanceSheet =>
      'Complete every balance sheet line item, even when a value is 0.';

  @override
  String get financialRatiosValidationNetSalesNegative =>
      'Net sales cannot be negative. Review discounts and returns.';

  @override
  String get financialRatiosValidationNegativeCostOfSales =>
      'Cost of sales cannot turn negative. Review beginning inventory, purchases, and ending inventory.';

  @override
  String get financialRatiosValidationGrossProfitInconsistent =>
      'Gross profit became inconsistent with the sales entered.';

  @override
  String get financialRatiosValidationOperatingIncomeInconsistent =>
      'EBIT became inconsistent with gross profit and operating expenses.';

  @override
  String get financialRatiosValidationNetReceivablesNegative =>
      'Net receivables cannot be negative. Review the allowance for doubtful accounts.';

  @override
  String get financialRatiosValidationFixedAssetsNegative =>
      'Net fixed assets cannot be negative. Review accumulated depreciation.';

  @override
  String get financialRatiosValidationTotalAssetsRequired =>
      'You need a positive asset base to generate the analysis.';

  @override
  String get financialRatiosValidationBalanceMismatch =>
      'The balance sheet does not tie: total assets must equal total liabilities plus equity.';

  @override
  String get financialRatiosValidationInventoryMismatch =>
      'Balance sheet inventory must match the ending inventory from the income statement.';

  @override
  String get financialRatiosBalanceMatches =>
      'The balance sheet ties correctly: assets and funding sources are aligned.';

  @override
  String financialRatiosBalanceAssetsHigher(Object difference) {
    return 'Assets exceed liabilities + equity by $difference. Review equity, debt, or ending inventory.';
  }

  @override
  String financialRatiosBalanceFundingHigher(Object difference) {
    return 'Liabilities + equity exceed assets by $difference. Review depreciation, net receivables, or equity.';
  }

  @override
  String get financialRatiosMetricCurrentRatioNote =>
      'Current ratio is not useful when current liabilities are zero or negative.';

  @override
  String get financialRatiosMetricQuickRatioNote =>
      'Quick ratio does not apply when current liabilities are zero or when the base does not represent enforceable obligations.';

  @override
  String get financialRatiosMetricCashRatioNote =>
      'Cash ratio requires positive current liabilities to produce a useful reading.';

  @override
  String get financialRatiosMetricInventoryTurnoverNote =>
      'Inventory turnover requires positive inventory. If inventory is zero, the ratio is not interpretable.';

  @override
  String get financialRatiosMetricDaysInventoryNote =>
      'Days in inventory requires a positive cost of sales to express storage time.';

  @override
  String get financialRatiosMetricReceivablesTurnoverNote =>
      'Receivables turnover requires positive net receivables.';

  @override
  String get financialRatiosMetricCollectionPeriodNote =>
      'Average collection period requires positive net sales.';

  @override
  String get financialRatiosMetricPayablesTurnoverNote =>
      'Payables turnover requires positive accounts payable.';

  @override
  String get financialRatiosMetricPaymentPeriodNote =>
      'Average payment period requires a positive cost of sales.';

  @override
  String get financialRatiosMetricTotalAssetTurnoverNote =>
      'Total asset turnover requires a positive asset base.';

  @override
  String get financialRatiosMetricFixedAssetTurnoverNote =>
      'Fixed asset turnover requires positive net fixed assets.';

  @override
  String get financialRatiosMetricDebtRatioNote =>
      'Debt ratio requires positive total assets.';

  @override
  String get financialRatiosMetricDebtToEquityNote =>
      'Debt-to-equity requires positive equity to avoid a distorted reading.';

  @override
  String get financialRatiosMetricEquityMultiplierNote =>
      'Equity multiplier requires positive equity.';

  @override
  String get financialRatiosMetricInterestCoverageNote =>
      'Interest coverage does not apply when there is no positive interest expense.';

  @override
  String get financialRatiosMetricGrossMarginNote =>
      'Gross margin requires positive net sales.';

  @override
  String get financialRatiosMetricOperatingMarginNote =>
      'Operating margin requires positive net sales.';

  @override
  String get financialRatiosMetricNetMarginNote =>
      'Net margin requires positive net sales.';

  @override
  String get financialRatiosMetricReturnOnAssetsNote =>
      'ROA requires positive total assets.';

  @override
  String get financialRatiosMetricReturnOnEquityNote =>
      'ROE requires positive equity.';

  @override
  String get financialRatiosMetricDupontNetMarginNote =>
      'The net margin component requires positive net sales.';

  @override
  String get financialRatiosMetricDupontAssetTurnoverNote =>
      'The turnover component requires positive total assets.';

  @override
  String get financialRatiosMetricDupontEquityMultiplierNote =>
      'The multiplier component requires positive equity.';

  @override
  String get financialRatiosMetricDupontRoeNote =>
      'DuPont ROE cannot be rebuilt while any component is missing.';

  @override
  String get homeRouteLabel => 'Home';

  @override
  String get featureBondsLabel => 'Bonds';

  @override
  String get featureSharesLabel => 'Shares';

  @override
  String get featureLeverageLabel => 'Leverage';

  @override
  String get featureRatiosLabel => 'Financial ratios';

  @override
  String get featureLeaseLabel => 'Financial lease';

  @override
  String get onboardingRouteLabel => 'Welcome';

  @override
  String get onboardingIndexLabel => 'Lab index';

  @override
  String get onboardingStatModules => 'modules';

  @override
  String get onboardingStatCalculators => 'calculators';

  @override
  String get onboardingStatLanguages => 'languages';

  @override
  String get onboardingChipBondPricing => 'Bond pricing';

  @override
  String get onboardingChipShareValuation => 'Share valuation';

  @override
  String get onboardingChipLeverage => 'Leverage';

  @override
  String get onboardingChipFinancialRatios => 'Financial ratios';

  @override
  String get onboardingChipLease => 'Financial lease';
}
