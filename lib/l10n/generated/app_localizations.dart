import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In es, this message translates to:
  /// **'Finance Pro'**
  String get appTitle;

  /// No description provided for @appTagline.
  ///
  /// In es, this message translates to:
  /// **'Finanzas corporativas con rutas claras, fórmulas vivas y calculadoras prácticas.'**
  String get appTagline;

  /// No description provided for @appPrimaryAction.
  ///
  /// In es, this message translates to:
  /// **'Entrar al laboratorio'**
  String get appPrimaryAction;

  /// No description provided for @appSecondaryAction.
  ///
  /// In es, this message translates to:
  /// **'Ir al inicio'**
  String get appSecondaryAction;

  /// No description provided for @appExploreAction.
  ///
  /// In es, this message translates to:
  /// **'Explorar módulo'**
  String get appExploreAction;

  /// No description provided for @appReadTopicAction.
  ///
  /// In es, this message translates to:
  /// **'Leer tema'**
  String get appReadTopicAction;

  /// No description provided for @appOpenCalculatorAction.
  ///
  /// In es, this message translates to:
  /// **'Abrir calculadora'**
  String get appOpenCalculatorAction;

  /// No description provided for @appRetryAction.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get appRetryAction;

  /// No description provided for @appBackAction.
  ///
  /// In es, this message translates to:
  /// **'Volver'**
  String get appBackAction;

  /// No description provided for @appBackHomeAction.
  ///
  /// In es, this message translates to:
  /// **'Volver al inicio'**
  String get appBackHomeAction;

  /// No description provided for @appToggleLanguageLabel.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get appToggleLanguageLabel;

  /// No description provided for @appSpanishLabel.
  ///
  /// In es, this message translates to:
  /// **'Español'**
  String get appSpanishLabel;

  /// No description provided for @appEnglishLabel.
  ///
  /// In es, this message translates to:
  /// **'English'**
  String get appEnglishLabel;

  /// No description provided for @appLoadingTitle.
  ///
  /// In es, this message translates to:
  /// **'Cargando contenido'**
  String get appLoadingTitle;

  /// No description provided for @appLoadingBody.
  ///
  /// In es, this message translates to:
  /// **'Preparando módulos, fórmulas y calculadoras.'**
  String get appLoadingBody;

  /// No description provided for @appSplashLabel.
  ///
  /// In es, this message translates to:
  /// **'Preparando el laboratorio financiero.'**
  String get appSplashLabel;

  /// No description provided for @appErrorTitle.
  ///
  /// In es, this message translates to:
  /// **'No pudimos cargar esta vista'**
  String get appErrorTitle;

  /// No description provided for @appErrorBody.
  ///
  /// In es, this message translates to:
  /// **'Verifica el contenido local y vuelve a intentarlo.'**
  String get appErrorBody;

  /// No description provided for @appEmptyTitle.
  ///
  /// In es, this message translates to:
  /// **'No hay contenido disponible'**
  String get appEmptyTitle;

  /// No description provided for @appEmptyBody.
  ///
  /// In es, this message translates to:
  /// **'Este módulo todavía no tiene contenido publicado.'**
  String get appEmptyBody;

  /// No description provided for @appTopicsSection.
  ///
  /// In es, this message translates to:
  /// **'Temas disponibles'**
  String get appTopicsSection;

  /// No description provided for @appHighlightsSection.
  ///
  /// In es, this message translates to:
  /// **'Por qué estudiar este módulo'**
  String get appHighlightsSection;

  /// No description provided for @appCalculatorSection.
  ///
  /// In es, this message translates to:
  /// **'Calculadora'**
  String get appCalculatorSection;

  /// No description provided for @appResultsSection.
  ///
  /// In es, this message translates to:
  /// **'Resultados'**
  String get appResultsSection;

  /// No description provided for @appFormulaSection.
  ///
  /// In es, this message translates to:
  /// **'Fórmulas'**
  String get appFormulaSection;

  /// No description provided for @appExamplesSection.
  ///
  /// In es, this message translates to:
  /// **'Ejemplos'**
  String get appExamplesSection;

  /// No description provided for @appInputsSection.
  ///
  /// In es, this message translates to:
  /// **'Entradas'**
  String get appInputsSection;

  /// No description provided for @appTopicSection.
  ///
  /// In es, this message translates to:
  /// **'Tema'**
  String get appTopicSection;

  /// No description provided for @appFooterPrimary.
  ///
  /// In es, this message translates to:
  /// **'Arquitectura limpia, contenido localizable y componentes con design system.'**
  String get appFooterPrimary;

  /// No description provided for @appFooterSecondary.
  ///
  /// In es, this message translates to:
  /// **'Pensado para web y preparado para crecer por features.'**
  String get appFooterSecondary;

  /// No description provided for @appFooterCreditsPrefix.
  ///
  /// In es, this message translates to:
  /// **'Créditos:'**
  String get appFooterCreditsPrefix;

  /// No description provided for @appFooterCreditsName.
  ///
  /// In es, this message translates to:
  /// **'Hensell'**
  String get appFooterCreditsName;

  /// No description provided for @appFooterCreditsLinkLabel.
  ///
  /// In es, this message translates to:
  /// **'hensell.dev'**
  String get appFooterCreditsLinkLabel;

  /// No description provided for @appNumericHint.
  ///
  /// In es, this message translates to:
  /// **'0.0'**
  String get appNumericHint;

  /// No description provided for @shellModulesLabel.
  ///
  /// In es, this message translates to:
  /// **'Módulos'**
  String get shellModulesLabel;

  /// No description provided for @validationPositiveNumbers.
  ///
  /// In es, this message translates to:
  /// **'Ingresa valores positivos válidos en todos los campos requeridos.'**
  String get validationPositiveNumbers;

  /// No description provided for @validationWholeYearsRequired.
  ///
  /// In es, this message translates to:
  /// **'Los años al vencimiento deben ser un entero positivo.'**
  String get validationWholeYearsRequired;

  /// No description provided for @validationNonNegativeNumbers.
  ///
  /// In es, this message translates to:
  /// **'Ingresa valores no negativos válidos.'**
  String get validationNonNegativeNumbers;

  /// No description provided for @bondCalculatorGuideTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo pensar este cálculo'**
  String get bondCalculatorGuideTitle;

  /// No description provided for @bondCalculatorGuideStepCashTitle.
  ///
  /// In es, this message translates to:
  /// **'1. Identifica los pagos del bono'**
  String get bondCalculatorGuideStepCashTitle;

  /// No description provided for @bondCalculatorGuideStepCashBody.
  ///
  /// In es, this message translates to:
  /// **'Primero ubica cuánto paga el bono cada año y cuánto devolverá al final.'**
  String get bondCalculatorGuideStepCashBody;

  /// No description provided for @bondCalculatorGuideStepMarketTitle.
  ///
  /// In es, this message translates to:
  /// **'2. Define tiempo y tasa del mercado'**
  String get bondCalculatorGuideStepMarketTitle;

  /// No description provided for @bondCalculatorGuideStepMarketBody.
  ///
  /// In es, this message translates to:
  /// **'Luego determina cuántos años faltan y qué rendimiento exige el inversionista.'**
  String get bondCalculatorGuideStepMarketBody;

  /// No description provided for @bondCalculatorGuideStepDecisionTitle.
  ///
  /// In es, this message translates to:
  /// **'3. Interpreta el precio'**
  String get bondCalculatorGuideStepDecisionTitle;

  /// No description provided for @bondCalculatorGuideStepDecisionBody.
  ///
  /// In es, this message translates to:
  /// **'Al final compara el precio estimado con el valor a la par para saber si hay prima, descuento o equilibrio.'**
  String get bondCalculatorGuideStepDecisionBody;

  /// No description provided for @bondCalculatorLiveFormulaLabel.
  ///
  /// In es, this message translates to:
  /// **'Sustitución en tiempo real'**
  String get bondCalculatorLiveFormulaLabel;

  /// No description provided for @bondCalculatorLiveFormulaSummary.
  ///
  /// In es, this message translates to:
  /// **'La fórmula se actualiza con tus datos mientras completas el ejercicio.'**
  String get bondCalculatorLiveFormulaSummary;

  /// No description provided for @bondCalculatorInterpretationTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo leer el resultado'**
  String get bondCalculatorInterpretationTitle;

  /// No description provided for @bondCalculatorStatusLabel.
  ///
  /// In es, this message translates to:
  /// **'Posición del bono'**
  String get bondCalculatorStatusLabel;

  /// No description provided for @bondCalculatorStatusPremium.
  ///
  /// In es, this message translates to:
  /// **'Con prima'**
  String get bondCalculatorStatusPremium;

  /// No description provided for @bondCalculatorStatusAtPar.
  ///
  /// In es, this message translates to:
  /// **'Cerca del valor a la par'**
  String get bondCalculatorStatusAtPar;

  /// No description provided for @bondCalculatorStatusDiscount.
  ///
  /// In es, this message translates to:
  /// **'Con descuento'**
  String get bondCalculatorStatusDiscount;

  /// No description provided for @bondCalculatorCouponRateLabel.
  ///
  /// In es, this message translates to:
  /// **'Tasa cupón implícita'**
  String get bondCalculatorCouponRateLabel;

  /// No description provided for @bondCalculatorDifferenceLabel.
  ///
  /// In es, this message translates to:
  /// **'Diferencia vs par'**
  String get bondCalculatorDifferenceLabel;

  /// No description provided for @bondCalculatorPremiumExplanation.
  ///
  /// In es, this message translates to:
  /// **'El bono está con prima porque la tasa cupón implícita ({couponRate}%) supera el rendimiento requerido ({requiredReturn}%). Eso empuja el precio por encima del valor a la par.'**
  String bondCalculatorPremiumExplanation(
    Object couponRate,
    Object requiredReturn,
  );

  /// No description provided for @bondCalculatorAtParExplanation.
  ///
  /// In es, this message translates to:
  /// **'El bono está muy cerca del valor a la par porque la tasa cupón implícita ({couponRate}%) es muy similar al rendimiento requerido ({requiredReturn}%).'**
  String bondCalculatorAtParExplanation(
    Object couponRate,
    Object requiredReturn,
  );

  /// No description provided for @bondCalculatorDiscountExplanation.
  ///
  /// In es, this message translates to:
  /// **'El bono está con descuento porque la tasa cupón implícita ({couponRate}%) queda por debajo del rendimiento requerido ({requiredReturn}%). Eso reduce el precio frente al valor a la par.'**
  String bondCalculatorDiscountExplanation(
    Object couponRate,
    Object requiredReturn,
  );

  /// No description provided for @shareCalculatorGuideTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo pensar este modelo'**
  String get shareCalculatorGuideTitle;

  /// No description provided for @shareCalculatorGuideStepModelTitle.
  ///
  /// In es, this message translates to:
  /// **'1. Elige el modelo correcto'**
  String get shareCalculatorGuideStepModelTitle;

  /// No description provided for @shareCalculatorGuideStepModelBody.
  ///
  /// In es, this message translates to:
  /// **'Primero decide si el problema usa dividendos sin crecimiento, crecimiento constante, dos etapas o una acción preferente.'**
  String get shareCalculatorGuideStepModelBody;

  /// No description provided for @shareCalculatorGuideStepDividendTitle.
  ///
  /// In es, this message translates to:
  /// **'2. Identifica qué dividendo te piden'**
  String get shareCalculatorGuideStepDividendTitle;

  /// No description provided for @shareCalculatorGuideStepDividendBody.
  ///
  /// In es, this message translates to:
  /// **'No siempre ingresas el mismo flujo: algunos modos parten de D₁, otros de D₀ y las preferentes usan D.'**
  String get shareCalculatorGuideStepDividendBody;

  /// No description provided for @shareCalculatorGuideStepInterpretTitle.
  ///
  /// In es, this message translates to:
  /// **'3. Interpreta el precio'**
  String get shareCalculatorGuideStepInterpretTitle;

  /// No description provided for @shareCalculatorGuideStepInterpretBody.
  ///
  /// In es, this message translates to:
  /// **'Después de calcular, revisa qué papel juegan el crecimiento, el rendimiento requerido y, si aplica, el valor terminal.'**
  String get shareCalculatorGuideStepInterpretBody;

  /// No description provided for @shareCalculatorModelSectionTitle.
  ///
  /// In es, this message translates to:
  /// **'Elige el enfoque de valuación'**
  String get shareCalculatorModelSectionTitle;

  /// No description provided for @shareCalculatorModelSectionSummary.
  ///
  /// In es, this message translates to:
  /// **'Cada modelo responde a un supuesto distinto sobre dividendos y crecimiento.'**
  String get shareCalculatorModelSectionSummary;

  /// No description provided for @shareCalculatorLiveFormulaLabel.
  ///
  /// In es, this message translates to:
  /// **'Sustitución en tiempo real'**
  String get shareCalculatorLiveFormulaLabel;

  /// No description provided for @shareCalculatorLiveFormulaSummary.
  ///
  /// In es, this message translates to:
  /// **'La fórmula cambia según el modelo activo y se actualiza con tus datos mientras escribes.'**
  String get shareCalculatorLiveFormulaSummary;

  /// No description provided for @shareCalculatorInterpretationTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo leer el resultado'**
  String get shareCalculatorInterpretationTitle;

  /// No description provided for @shareCalculatorDividendBasisLabel.
  ///
  /// In es, this message translates to:
  /// **'Dividendo usado'**
  String get shareCalculatorDividendBasisLabel;

  /// No description provided for @shareCalculatorRequiredReturnLabel.
  ///
  /// In es, this message translates to:
  /// **'Rendimiento requerido'**
  String get shareCalculatorRequiredReturnLabel;

  /// No description provided for @shareCalculatorSpreadLabel.
  ///
  /// In es, this message translates to:
  /// **'Spread de valuación'**
  String get shareCalculatorSpreadLabel;

  /// No description provided for @shareCalculatorTerminalWeightLabel.
  ///
  /// In es, this message translates to:
  /// **'Peso del valor terminal'**
  String get shareCalculatorTerminalWeightLabel;

  /// No description provided for @shareCalculatorZeroGrowthExplanation.
  ///
  /// In es, this message translates to:
  /// **'Este modelo trata la acción como una perpetuidad simple usando D₁ y un rendimiento requerido de {requiredReturn}%. Funciona mejor cuando no esperas crecimiento en dividendos.'**
  String shareCalculatorZeroGrowthExplanation(Object requiredReturn);

  /// No description provided for @shareCalculatorPreferredExplanation.
  ///
  /// In es, this message translates to:
  /// **'La acción preferente se valora como una perpetuidad con dividendo fijo y un rendimiento requerido de {requiredReturn}%. Aquí el flujo relevante es D, no D₀ ni D₁.'**
  String shareCalculatorPreferredExplanation(Object requiredReturn);

  /// No description provided for @shareCalculatorConstantGrowthExplanation.
  ///
  /// In es, this message translates to:
  /// **'El precio depende del spread entre k_s y g. Con un crecimiento de {growthRate}% y un spread de {spread}%, el modelo de Gordon sigue siendo válido porque k_s permanece por encima de g.'**
  String shareCalculatorConstantGrowthExplanation(
    Object growthRate,
    Object spread,
  );

  /// No description provided for @shareCalculatorVariableGrowthExplanation.
  ///
  /// In es, this message translates to:
  /// **'El resultado suma dividendos proyectados durante {periods} periodos y un valor terminal calculado con g₂ = {terminalGrowth}%. En este caso, el valor terminal pesa aproximadamente {terminalWeight}% del precio estimado.'**
  String shareCalculatorVariableGrowthExplanation(
    Object periods,
    Object terminalGrowth,
    Object terminalWeight,
  );

  /// No description provided for @leverageCalculatorGuideTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo pensar este cálculo'**
  String get leverageCalculatorGuideTitle;

  /// No description provided for @leverageCalculatorGuideStepModeTitle.
  ///
  /// In es, this message translates to:
  /// **'1. Elige el tipo correcto'**
  String get leverageCalculatorGuideStepModeTitle;

  /// No description provided for @leverageCalculatorGuideStepModeBody.
  ///
  /// In es, this message translates to:
  /// **'Primero decide si el problema habla de sensibilidad del EBIT frente a ventas o de sensibilidad para accionistas frente a la UAII.'**
  String get leverageCalculatorGuideStepModeBody;

  /// No description provided for @leverageCalculatorGuideStepBaseTitle.
  ///
  /// In es, this message translates to:
  /// **'2. Revisa la base sensible'**
  String get leverageCalculatorGuideStepBaseTitle;

  /// No description provided for @leverageCalculatorGuideStepBaseBody.
  ///
  /// In es, this message translates to:
  /// **'Luego confirma que la base del denominador siga siendo positiva. Si se acerca a cero, el riesgo sube y el grado se dispara.'**
  String get leverageCalculatorGuideStepBaseBody;

  /// No description provided for @leverageCalculatorGuideStepInterpretTitle.
  ///
  /// In es, this message translates to:
  /// **'3. Interpreta la amplificación'**
  String get leverageCalculatorGuideStepInterpretTitle;

  /// No description provided for @leverageCalculatorGuideStepInterpretBody.
  ///
  /// In es, this message translates to:
  /// **'Un grado de 2 no significa 2 dólares más: significa que un cambio porcentual de 1% se amplifica aproximadamente al doble.'**
  String get leverageCalculatorGuideStepInterpretBody;

  /// No description provided for @leverageCalculatorModeSectionTitle.
  ///
  /// In es, this message translates to:
  /// **'Elige el tipo de apalancamiento'**
  String get leverageCalculatorModeSectionTitle;

  /// No description provided for @leverageCalculatorModeSectionSummary.
  ///
  /// In es, this message translates to:
  /// **'Cada modo parte de una base distinta y responde a un riesgo distinto dentro del negocio.'**
  String get leverageCalculatorModeSectionSummary;

  /// No description provided for @leverageCalculatorLiveFormulaLabel.
  ///
  /// In es, this message translates to:
  /// **'Sustitución en tiempo real'**
  String get leverageCalculatorLiveFormulaLabel;

  /// No description provided for @leverageCalculatorLiveFormulaSummary.
  ///
  /// In es, this message translates to:
  /// **'La fórmula se actualiza con tus datos para que veas qué entra en el numerador y qué queda como base sensible.'**
  String get leverageCalculatorLiveFormulaSummary;

  /// No description provided for @leverageCalculatorInterpretationTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo leer el resultado'**
  String get leverageCalculatorInterpretationTitle;

  /// No description provided for @leverageCalculatorSensitivityLabel.
  ///
  /// In es, this message translates to:
  /// **'Nivel de sensibilidad'**
  String get leverageCalculatorSensitivityLabel;

  /// No description provided for @leverageCalculatorSensitivityMeasured.
  ///
  /// In es, this message translates to:
  /// **'Moderada'**
  String get leverageCalculatorSensitivityMeasured;

  /// No description provided for @leverageCalculatorSensitivityElevated.
  ///
  /// In es, this message translates to:
  /// **'Elevada'**
  String get leverageCalculatorSensitivityElevated;

  /// No description provided for @leverageCalculatorSensitivityHigh.
  ///
  /// In es, this message translates to:
  /// **'Alta'**
  String get leverageCalculatorSensitivityHigh;

  /// No description provided for @leverageCalculatorContributionMarginLabel.
  ///
  /// In es, this message translates to:
  /// **'Margen de contribución total'**
  String get leverageCalculatorContributionMarginLabel;

  /// No description provided for @leverageCalculatorEbitLabel.
  ///
  /// In es, this message translates to:
  /// **'EBIT estimado'**
  String get leverageCalculatorEbitLabel;

  /// No description provided for @leverageCalculatorCommonBaseLabel.
  ///
  /// In es, this message translates to:
  /// **'Base disponible para comunes'**
  String get leverageCalculatorCommonBaseLabel;

  /// No description provided for @leverageCalculatorTaxAdjustedPreferredLabel.
  ///
  /// In es, this message translates to:
  /// **'Dividendos preferentes ajustados'**
  String get leverageCalculatorTaxAdjustedPreferredLabel;

  /// No description provided for @leverageCalculatorOperatingExplanation.
  ///
  /// In es, this message translates to:
  /// **'Con un GAO de {amplification}, un cambio de 1% en ventas movería aproximadamente {amplification}% el EBIT. En este ejercicio, el margen de contribución total es {contributionMargin} y el EBIT estimado es {ebit}.'**
  String leverageCalculatorOperatingExplanation(
    Object amplification,
    Object contributionMargin,
    Object ebit,
  );

  /// No description provided for @leverageCalculatorFinancialExplanation.
  ///
  /// In es, this message translates to:
  /// **'Con un GAF de {amplification}, un cambio de 1% en la UAII movería aproximadamente {amplification}% la utilidad disponible para accionistas comunes. Aquí la base disponible para comunes es {commonBase} y el ajuste fiscal de dividendos preferentes es {taxAdjustedPreferred}.'**
  String leverageCalculatorFinancialExplanation(
    Object amplification,
    Object commonBase,
    Object taxAdjustedPreferred,
  );

  /// No description provided for @leaseCalculatorGuideTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo pensar esta comparación'**
  String get leaseCalculatorGuideTitle;

  /// No description provided for @leaseCalculatorGuideStepLeaseTitle.
  ///
  /// In es, this message translates to:
  /// **'1. Calcula el costo del lease'**
  String get leaseCalculatorGuideStepLeaseTitle;

  /// No description provided for @leaseCalculatorGuideStepLeaseBody.
  ///
  /// In es, this message translates to:
  /// **'Convierte todas las cuotas futuras del arrendamiento a una sola cifra en valor presente.'**
  String get leaseCalculatorGuideStepLeaseBody;

  /// No description provided for @leaseCalculatorGuideStepBuyTitle.
  ///
  /// In es, this message translates to:
  /// **'2. Calcula el costo neto de comprar'**
  String get leaseCalculatorGuideStepBuyTitle;

  /// No description provided for @leaseCalculatorGuideStepBuyBody.
  ///
  /// In es, this message translates to:
  /// **'Parte del precio hoy y resta el valor residual futuro descontado para no comparar flujos en fechas distintas.'**
  String get leaseCalculatorGuideStepBuyBody;

  /// No description provided for @leaseCalculatorGuideStepDecisionTitle.
  ///
  /// In es, this message translates to:
  /// **'3. Compara y decide'**
  String get leaseCalculatorGuideStepDecisionTitle;

  /// No description provided for @leaseCalculatorGuideStepDecisionBody.
  ///
  /// In es, this message translates to:
  /// **'La alternativa con menor valor presente es la menos costosa en términos económicos, aunque la decisión final también puede considerar flexibilidad o riesgo.'**
  String get leaseCalculatorGuideStepDecisionBody;

  /// No description provided for @leaseCalculatorLiveFormulaLabel.
  ///
  /// In es, this message translates to:
  /// **'Sustitución en tiempo real'**
  String get leaseCalculatorLiveFormulaLabel;

  /// No description provided for @leaseCalculatorLiveFormulaSummary.
  ///
  /// In es, this message translates to:
  /// **'La comparación se actualiza con tus datos para que veas al mismo tiempo el costo del lease y el costo neto de comprar.'**
  String get leaseCalculatorLiveFormulaSummary;

  /// No description provided for @leaseCalculatorInterpretationTitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo leer el resultado'**
  String get leaseCalculatorInterpretationTitle;

  /// No description provided for @leaseCalculatorRecommendationLabel.
  ///
  /// In es, this message translates to:
  /// **'Alternativa sugerida'**
  String get leaseCalculatorRecommendationLabel;

  /// No description provided for @leaseCalculatorRecommendationLease.
  ///
  /// In es, this message translates to:
  /// **'Conviene arrendar'**
  String get leaseCalculatorRecommendationLease;

  /// No description provided for @leaseCalculatorRecommendationBuy.
  ///
  /// In es, this message translates to:
  /// **'Conviene comprar'**
  String get leaseCalculatorRecommendationBuy;

  /// No description provided for @leaseCalculatorRecommendationNeutral.
  ///
  /// In es, this message translates to:
  /// **'Resultado muy parecido'**
  String get leaseCalculatorRecommendationNeutral;

  /// No description provided for @leaseCalculatorDifferenceLabel.
  ///
  /// In es, this message translates to:
  /// **'Ahorro relativo'**
  String get leaseCalculatorDifferenceLabel;

  /// No description provided for @leaseCalculatorResidualBenefitLabel.
  ///
  /// In es, this message translates to:
  /// **'Valor residual descontado'**
  String get leaseCalculatorResidualBenefitLabel;

  /// No description provided for @leaseCalculatorLeaseExplanation.
  ///
  /// In es, this message translates to:
  /// **'Con una tasa de descuento de {rate}%, el arrendamiento consume menos valor presente por aproximadamente {savings}. El valor residual descontado de la compra sería {residual}, pero aun así la alternativa de lease sigue siendo más ligera en costo económico.'**
  String leaseCalculatorLeaseExplanation(
    Object savings,
    Object rate,
    Object residual,
  );

  /// No description provided for @leaseCalculatorBuyExplanation.
  ///
  /// In es, this message translates to:
  /// **'Con una tasa de descuento de {rate}%, comprar hoy resulta más conveniente por aproximadamente {savings}. El valor residual descontado recupera cerca de {residual}, y eso reduce el costo neto de compra por debajo del lease.'**
  String leaseCalculatorBuyExplanation(
    Object savings,
    Object rate,
    Object residual,
  );

  /// No description provided for @leaseCalculatorNeutralExplanation.
  ///
  /// In es, this message translates to:
  /// **'Con una tasa de descuento de {rate}% y un valor residual descontado cercano a {residual}, ambas alternativas quedan muy próximas en valor presente. La decisión final puede depender de liquidez, flexibilidad o riesgo operativo.'**
  String leaseCalculatorNeutralExplanation(Object rate, Object residual);

  /// No description provided for @validationGrowthLessThanReturn.
  ///
  /// In es, this message translates to:
  /// **'La tasa de crecimiento debe ser menor al rendimiento requerido.'**
  String get validationGrowthLessThanReturn;

  /// No description provided for @validationPeriodsRequired.
  ///
  /// In es, this message translates to:
  /// **'Cuando usas crecimiento variable, el número de periodos debe ser mayor que cero.'**
  String get validationPeriodsRequired;

  /// No description provided for @validationLeaseRequiredFields.
  ///
  /// In es, this message translates to:
  /// **'Completa el pago del lease, los periodos, la tasa, el precio de compra y el valor residual con valores válidos.'**
  String get validationLeaseRequiredFields;

  /// No description provided for @validationLeasePeriodsRequired.
  ///
  /// In es, this message translates to:
  /// **'El número de periodos del arrendamiento debe ser un entero positivo.'**
  String get validationLeasePeriodsRequired;

  /// No description provided for @validationLeaseResidualExceedsPrice.
  ///
  /// In es, this message translates to:
  /// **'El valor residual no debe superar el precio de compra en este análisis básico.'**
  String get validationLeaseResidualExceedsPrice;

  /// No description provided for @validationTaxRateRange.
  ///
  /// In es, this message translates to:
  /// **'La tasa de impuestos debe estar entre 0 y ser menor que 100.'**
  String get validationTaxRateRange;

  /// No description provided for @validationLeverageOperatingDenominator.
  ///
  /// In es, this message translates to:
  /// **'El margen de contribución total debe superar los costos fijos para calcular el apalancamiento operativo.'**
  String get validationLeverageOperatingDenominator;

  /// No description provided for @validationLeverageFinancialDenominator.
  ///
  /// In es, this message translates to:
  /// **'La utilidad disponible para accionistas comunes debe ser mayor que cero para calcular el apalancamiento financiero.'**
  String get validationLeverageFinancialDenominator;

  /// No description provided for @validationRatiosRequired.
  ///
  /// In es, this message translates to:
  /// **'Completa todos los campos necesarios para calcular las razones financieras.'**
  String get validationRatiosRequired;

  /// No description provided for @financialRatiosContinueAction.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get financialRatiosContinueAction;

  /// No description provided for @financialRatiosLoadSampleAction.
  ///
  /// In es, this message translates to:
  /// **'Llenar con datos de prueba'**
  String get financialRatiosLoadSampleAction;

  /// No description provided for @financialRatiosFormulaFallback.
  ///
  /// In es, this message translates to:
  /// **'Selecciona un paso o una familia de razones para ver las fórmulas relevantes.'**
  String get financialRatiosFormulaFallback;

  /// No description provided for @financialRatiosStatementPreviewTitle.
  ///
  /// In es, this message translates to:
  /// **'Subtotales derivados'**
  String get financialRatiosStatementPreviewTitle;

  /// No description provided for @financialRatiosStatementPreviewSummary.
  ///
  /// In es, this message translates to:
  /// **'El builder recalcula estos saldos cada vez que cambias una partida base.'**
  String get financialRatiosStatementPreviewSummary;

  /// No description provided for @financialRatiosBalancePreviewTitle.
  ///
  /// In es, this message translates to:
  /// **'Comprobación contable'**
  String get financialRatiosBalancePreviewTitle;

  /// No description provided for @financialRatiosBalancePreviewSummary.
  ///
  /// In es, this message translates to:
  /// **'Usa este bloque para revisar el cuadre y detectar inconsistencias antes de analizar.'**
  String get financialRatiosBalancePreviewSummary;

  /// No description provided for @financialRatiosNetSalesLabel.
  ///
  /// In es, this message translates to:
  /// **'Ventas netas'**
  String get financialRatiosNetSalesLabel;

  /// No description provided for @financialRatiosNetPurchasesLabel.
  ///
  /// In es, this message translates to:
  /// **'Compras netas'**
  String get financialRatiosNetPurchasesLabel;

  /// No description provided for @financialRatiosCostOfSalesLabel.
  ///
  /// In es, this message translates to:
  /// **'Costo de ventas'**
  String get financialRatiosCostOfSalesLabel;

  /// No description provided for @financialRatiosGrossProfitLabel.
  ///
  /// In es, this message translates to:
  /// **'Utilidad bruta'**
  String get financialRatiosGrossProfitLabel;

  /// No description provided for @financialRatiosOperatingExpensesLabel.
  ///
  /// In es, this message translates to:
  /// **'Gastos operativos'**
  String get financialRatiosOperatingExpensesLabel;

  /// No description provided for @financialRatiosEbitLabel.
  ///
  /// In es, this message translates to:
  /// **'EBIT'**
  String get financialRatiosEbitLabel;

  /// No description provided for @financialRatiosEarningsBeforeTaxesLabel.
  ///
  /// In es, this message translates to:
  /// **'Utilidad antes de impuestos'**
  String get financialRatiosEarningsBeforeTaxesLabel;

  /// No description provided for @financialRatiosNetIncomeLabel.
  ///
  /// In es, this message translates to:
  /// **'Utilidad neta'**
  String get financialRatiosNetIncomeLabel;

  /// No description provided for @financialRatiosCurrentAssetsLabel.
  ///
  /// In es, this message translates to:
  /// **'Activos corrientes'**
  String get financialRatiosCurrentAssetsLabel;

  /// No description provided for @financialRatiosFixedAssetsNetLabel.
  ///
  /// In es, this message translates to:
  /// **'Activos fijos netos'**
  String get financialRatiosFixedAssetsNetLabel;

  /// No description provided for @financialRatiosTotalAssetsLabel.
  ///
  /// In es, this message translates to:
  /// **'Activos totales'**
  String get financialRatiosTotalAssetsLabel;

  /// No description provided for @financialRatiosCurrentLiabilitiesLabel.
  ///
  /// In es, this message translates to:
  /// **'Pasivos corrientes'**
  String get financialRatiosCurrentLiabilitiesLabel;

  /// No description provided for @financialRatiosNonCurrentLiabilitiesLabel.
  ///
  /// In es, this message translates to:
  /// **'Pasivos no corrientes'**
  String get financialRatiosNonCurrentLiabilitiesLabel;

  /// No description provided for @financialRatiosTotalLiabilitiesLabel.
  ///
  /// In es, this message translates to:
  /// **'Pasivos totales'**
  String get financialRatiosTotalLiabilitiesLabel;

  /// No description provided for @financialRatiosEquityLabel.
  ///
  /// In es, this message translates to:
  /// **'Patrimonio'**
  String get financialRatiosEquityLabel;

  /// No description provided for @financialRatiosLiabilitiesAndEquityLabel.
  ///
  /// In es, this message translates to:
  /// **'Pasivos + patrimonio'**
  String get financialRatiosLiabilitiesAndEquityLabel;

  /// No description provided for @financialRatiosBalanceDifferenceLabel.
  ///
  /// In es, this message translates to:
  /// **'Diferencia de cuadre'**
  String get financialRatiosBalanceDifferenceLabel;

  /// No description provided for @financialRatiosValidationNumeric.
  ///
  /// In es, this message translates to:
  /// **'Ingresa números válidos o deja el campo vacío si la partida es cero.'**
  String get financialRatiosValidationNumeric;

  /// No description provided for @financialRatiosValidationCompleteIncomeStatement.
  ///
  /// In es, this message translates to:
  /// **'Completa todas las partidas del estado de resultados, incluso si alguna vale 0.'**
  String get financialRatiosValidationCompleteIncomeStatement;

  /// No description provided for @financialRatiosValidationCompleteBalanceSheet.
  ///
  /// In es, this message translates to:
  /// **'Completa todas las partidas del balance general, incluso si alguna vale 0.'**
  String get financialRatiosValidationCompleteBalanceSheet;

  /// No description provided for @financialRatiosValidationNetSalesNegative.
  ///
  /// In es, this message translates to:
  /// **'Las ventas netas no pueden ser negativas. Revisa descuentos y devoluciones.'**
  String get financialRatiosValidationNetSalesNegative;

  /// No description provided for @financialRatiosValidationNegativeCostOfSales.
  ///
  /// In es, this message translates to:
  /// **'El costo de ventas no puede quedar negativo. Revisa inventario inicial, compras e inventario final.'**
  String get financialRatiosValidationNegativeCostOfSales;

  /// No description provided for @financialRatiosValidationGrossProfitInconsistent.
  ///
  /// In es, this message translates to:
  /// **'La utilidad bruta quedó inconsistente con las ventas registradas.'**
  String get financialRatiosValidationGrossProfitInconsistent;

  /// No description provided for @financialRatiosValidationOperatingIncomeInconsistent.
  ///
  /// In es, this message translates to:
  /// **'El EBIT quedó inconsistente con la utilidad bruta y los gastos operativos.'**
  String get financialRatiosValidationOperatingIncomeInconsistent;

  /// No description provided for @financialRatiosValidationNetReceivablesNegative.
  ///
  /// In es, this message translates to:
  /// **'Las cuentas por cobrar netas no pueden ser negativas. Revisa la estimación de incobrables.'**
  String get financialRatiosValidationNetReceivablesNegative;

  /// No description provided for @financialRatiosValidationFixedAssetsNegative.
  ///
  /// In es, this message translates to:
  /// **'Los activos fijos netos no pueden ser negativos. Revisa la depreciación acumulada.'**
  String get financialRatiosValidationFixedAssetsNegative;

  /// No description provided for @financialRatiosValidationTotalAssetsRequired.
  ///
  /// In es, this message translates to:
  /// **'Necesitas una base de activos positiva para generar el análisis.'**
  String get financialRatiosValidationTotalAssetsRequired;

  /// No description provided for @financialRatiosValidationBalanceMismatch.
  ///
  /// In es, this message translates to:
  /// **'El balance no cuadra: activos totales deben ser iguales a pasivos totales más patrimonio.'**
  String get financialRatiosValidationBalanceMismatch;

  /// No description provided for @financialRatiosValidationInventoryMismatch.
  ///
  /// In es, this message translates to:
  /// **'El inventario del balance debe coincidir con el inventario final del estado de resultados.'**
  String get financialRatiosValidationInventoryMismatch;

  /// No description provided for @financialRatiosBalanceMatches.
  ///
  /// In es, this message translates to:
  /// **'El balance cuadra correctamente: activos y fuentes de financiamiento están alineados.'**
  String get financialRatiosBalanceMatches;

  /// No description provided for @financialRatiosBalanceAssetsHigher.
  ///
  /// In es, this message translates to:
  /// **'Los activos superan a pasivos + patrimonio por {difference}. Revisa patrimonio, deuda o el inventario final.'**
  String financialRatiosBalanceAssetsHigher(Object difference);

  /// No description provided for @financialRatiosBalanceFundingHigher.
  ///
  /// In es, this message translates to:
  /// **'Pasivos + patrimonio superan a los activos por {difference}. Revisa depreciación, cuentas por cobrar netas o patrimonio.'**
  String financialRatiosBalanceFundingHigher(Object difference);

  /// No description provided for @financialRatiosMetricCurrentRatioNote.
  ///
  /// In es, this message translates to:
  /// **'Si el pasivo corriente es cero o negativo, la liquidez corriente no se puede interpretar de forma útil.'**
  String get financialRatiosMetricCurrentRatioNote;

  /// No description provided for @financialRatiosMetricQuickRatioNote.
  ///
  /// In es, this message translates to:
  /// **'La prueba ácida no aplica cuando el pasivo corriente es cero o cuando la base no representa obligaciones exigibles.'**
  String get financialRatiosMetricQuickRatioNote;

  /// No description provided for @financialRatiosMetricCashRatioNote.
  ///
  /// In es, this message translates to:
  /// **'La razón de efectivo requiere pasivos corrientes positivos para una lectura útil.'**
  String get financialRatiosMetricCashRatioNote;

  /// No description provided for @financialRatiosMetricInventoryTurnoverNote.
  ///
  /// In es, this message translates to:
  /// **'La rotación de inventario requiere inventario positivo. Si el inventario es cero, la razón no es interpretable.'**
  String get financialRatiosMetricInventoryTurnoverNote;

  /// No description provided for @financialRatiosMetricDaysInventoryNote.
  ///
  /// In es, this message translates to:
  /// **'Los días de inventario requieren un costo de ventas positivo para expresar permanencia en bodega.'**
  String get financialRatiosMetricDaysInventoryNote;

  /// No description provided for @financialRatiosMetricReceivablesTurnoverNote.
  ///
  /// In es, this message translates to:
  /// **'La rotación de cuentas por cobrar requiere cuentas por cobrar netas positivas.'**
  String get financialRatiosMetricReceivablesTurnoverNote;

  /// No description provided for @financialRatiosMetricCollectionPeriodNote.
  ///
  /// In es, this message translates to:
  /// **'El periodo promedio de cobro requiere ventas netas positivas.'**
  String get financialRatiosMetricCollectionPeriodNote;

  /// No description provided for @financialRatiosMetricPayablesTurnoverNote.
  ///
  /// In es, this message translates to:
  /// **'La rotación de cuentas por pagar requiere proveedores positivos.'**
  String get financialRatiosMetricPayablesTurnoverNote;

  /// No description provided for @financialRatiosMetricPaymentPeriodNote.
  ///
  /// In es, this message translates to:
  /// **'El periodo promedio de pago requiere un costo de ventas positivo.'**
  String get financialRatiosMetricPaymentPeriodNote;

  /// No description provided for @financialRatiosMetricTotalAssetTurnoverNote.
  ///
  /// In es, this message translates to:
  /// **'La rotación de activos totales requiere una base de activos positiva.'**
  String get financialRatiosMetricTotalAssetTurnoverNote;

  /// No description provided for @financialRatiosMetricFixedAssetTurnoverNote.
  ///
  /// In es, this message translates to:
  /// **'La rotación de activos fijos requiere activos fijos netos positivos.'**
  String get financialRatiosMetricFixedAssetTurnoverNote;

  /// No description provided for @financialRatiosMetricDebtRatioNote.
  ///
  /// In es, this message translates to:
  /// **'El índice de endeudamiento requiere activos totales positivos.'**
  String get financialRatiosMetricDebtRatioNote;

  /// No description provided for @financialRatiosMetricDebtToEquityNote.
  ///
  /// In es, this message translates to:
  /// **'Deuda a patrimonio requiere patrimonio positivo para evitar una lectura distorsionada.'**
  String get financialRatiosMetricDebtToEquityNote;

  /// No description provided for @financialRatiosMetricEquityMultiplierNote.
  ///
  /// In es, this message translates to:
  /// **'El multiplicador del capital requiere patrimonio positivo.'**
  String get financialRatiosMetricEquityMultiplierNote;

  /// No description provided for @financialRatiosMetricInterestCoverageNote.
  ///
  /// In es, this message translates to:
  /// **'La cobertura de intereses no aplica si no hay gasto financiero positivo en el periodo.'**
  String get financialRatiosMetricInterestCoverageNote;

  /// No description provided for @financialRatiosMetricGrossMarginNote.
  ///
  /// In es, this message translates to:
  /// **'El margen bruto requiere ventas netas positivas.'**
  String get financialRatiosMetricGrossMarginNote;

  /// No description provided for @financialRatiosMetricOperatingMarginNote.
  ///
  /// In es, this message translates to:
  /// **'El margen operativo requiere ventas netas positivas.'**
  String get financialRatiosMetricOperatingMarginNote;

  /// No description provided for @financialRatiosMetricNetMarginNote.
  ///
  /// In es, this message translates to:
  /// **'El margen neto requiere ventas netas positivas.'**
  String get financialRatiosMetricNetMarginNote;

  /// No description provided for @financialRatiosMetricReturnOnAssetsNote.
  ///
  /// In es, this message translates to:
  /// **'ROA requiere activos totales positivos.'**
  String get financialRatiosMetricReturnOnAssetsNote;

  /// No description provided for @financialRatiosMetricReturnOnEquityNote.
  ///
  /// In es, this message translates to:
  /// **'ROE requiere patrimonio positivo.'**
  String get financialRatiosMetricReturnOnEquityNote;

  /// No description provided for @financialRatiosMetricDupontNetMarginNote.
  ///
  /// In es, this message translates to:
  /// **'El componente de margen neto requiere ventas netas positivas.'**
  String get financialRatiosMetricDupontNetMarginNote;

  /// No description provided for @financialRatiosMetricDupontAssetTurnoverNote.
  ///
  /// In es, this message translates to:
  /// **'El componente de rotación requiere activos totales positivos.'**
  String get financialRatiosMetricDupontAssetTurnoverNote;

  /// No description provided for @financialRatiosMetricDupontEquityMultiplierNote.
  ///
  /// In es, this message translates to:
  /// **'El componente de multiplicador requiere patrimonio positivo.'**
  String get financialRatiosMetricDupontEquityMultiplierNote;

  /// No description provided for @financialRatiosMetricDupontRoeNote.
  ///
  /// In es, this message translates to:
  /// **'El ROE de DuPont no se puede reconstruir mientras falte algún componente válido.'**
  String get financialRatiosMetricDupontRoeNote;

  /// No description provided for @homeRouteLabel.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get homeRouteLabel;

  /// No description provided for @featureBondsLabel.
  ///
  /// In es, this message translates to:
  /// **'Bonos'**
  String get featureBondsLabel;

  /// No description provided for @featureSharesLabel.
  ///
  /// In es, this message translates to:
  /// **'Acciones'**
  String get featureSharesLabel;

  /// No description provided for @featureLeverageLabel.
  ///
  /// In es, this message translates to:
  /// **'Apalancamiento'**
  String get featureLeverageLabel;

  /// No description provided for @featureRatiosLabel.
  ///
  /// In es, this message translates to:
  /// **'Razones financieras'**
  String get featureRatiosLabel;

  /// No description provided for @featureLeaseLabel.
  ///
  /// In es, this message translates to:
  /// **'Arrendamiento financiero'**
  String get featureLeaseLabel;

  /// No description provided for @onboardingRouteLabel.
  ///
  /// In es, this message translates to:
  /// **'Bienvenida'**
  String get onboardingRouteLabel;

  /// No description provided for @onboardingIndexLabel.
  ///
  /// In es, this message translates to:
  /// **'Mapa del laboratorio'**
  String get onboardingIndexLabel;

  /// No description provided for @onboardingStatModules.
  ///
  /// In es, this message translates to:
  /// **'módulos'**
  String get onboardingStatModules;

  /// No description provided for @onboardingStatCalculators.
  ///
  /// In es, this message translates to:
  /// **'calculadoras'**
  String get onboardingStatCalculators;

  /// No description provided for @onboardingStatLanguages.
  ///
  /// In es, this message translates to:
  /// **'idiomas'**
  String get onboardingStatLanguages;

  /// No description provided for @onboardingChipBondPricing.
  ///
  /// In es, this message translates to:
  /// **'Precio de bonos'**
  String get onboardingChipBondPricing;

  /// No description provided for @onboardingChipShareValuation.
  ///
  /// In es, this message translates to:
  /// **'Valuación de acciones'**
  String get onboardingChipShareValuation;

  /// No description provided for @onboardingChipLeverage.
  ///
  /// In es, this message translates to:
  /// **'Apalancamiento'**
  String get onboardingChipLeverage;

  /// No description provided for @onboardingChipFinancialRatios.
  ///
  /// In es, this message translates to:
  /// **'Razones financieras'**
  String get onboardingChipFinancialRatios;

  /// No description provided for @onboardingChipLease.
  ///
  /// In es, this message translates to:
  /// **'Arrendamiento financiero'**
  String get onboardingChipLease;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
