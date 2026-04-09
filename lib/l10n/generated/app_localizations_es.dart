// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Finance Pro';

  @override
  String get appTagline =>
      'Finanzas corporativas con rutas claras, fórmulas vivas y calculadoras prácticas.';

  @override
  String get appPrimaryAction => 'Entrar al laboratorio';

  @override
  String get appSecondaryAction => 'Ir al inicio';

  @override
  String get appExploreAction => 'Explorar módulo';

  @override
  String get appReadTopicAction => 'Leer tema';

  @override
  String get appOpenCalculatorAction => 'Abrir calculadora';

  @override
  String get appRetryAction => 'Reintentar';

  @override
  String get appBackAction => 'Volver';

  @override
  String get appBackHomeAction => 'Volver al inicio';

  @override
  String get appToggleLanguageLabel => 'Idioma';

  @override
  String get appSpanishLabel => 'Español';

  @override
  String get appEnglishLabel => 'English';

  @override
  String get appLoadingTitle => 'Cargando contenido';

  @override
  String get appLoadingBody => 'Preparando módulos, fórmulas y calculadoras.';

  @override
  String get appSplashLabel => 'Preparando el laboratorio financiero.';

  @override
  String get appErrorTitle => 'No pudimos cargar esta vista';

  @override
  String get appErrorBody =>
      'Verifica el contenido local y vuelve a intentarlo.';

  @override
  String get appEmptyTitle => 'No hay contenido disponible';

  @override
  String get appEmptyBody =>
      'Este módulo todavía no tiene contenido publicado.';

  @override
  String get appTopicsSection => 'Temas disponibles';

  @override
  String get appHighlightsSection => 'Por qué estudiar este módulo';

  @override
  String get appCalculatorSection => 'Calculadora';

  @override
  String get appResultsSection => 'Resultados';

  @override
  String get appFormulaSection => 'Fórmulas';

  @override
  String get appExamplesSection => 'Ejemplos';

  @override
  String get appInputsSection => 'Entradas';

  @override
  String get appTopicSection => 'Tema';

  @override
  String get appFooterPrimary =>
      'Arquitectura limpia, contenido localizable y componentes con design system.';

  @override
  String get appFooterSecondary =>
      'Pensado para web y preparado para crecer por features.';

  @override
  String get appFooterCreditsPrefix => 'Créditos:';

  @override
  String get appFooterCreditsName => 'Hensell';

  @override
  String get appFooterCreditsLinkLabel => 'hensell.dev';

  @override
  String get appNumericHint => '0.0';

  @override
  String get shellModulesLabel => 'Módulos';

  @override
  String get validationPositiveNumbers =>
      'Ingresa valores positivos válidos en todos los campos requeridos.';

  @override
  String get validationWholeYearsRequired =>
      'Los años al vencimiento deben ser un entero positivo.';

  @override
  String get validationNonNegativeNumbers =>
      'Ingresa valores no negativos válidos.';

  @override
  String get bondCalculatorGuideTitle => 'Cómo pensar este cálculo';

  @override
  String get bondCalculatorGuideStepCashTitle =>
      '1. Identifica los pagos del bono';

  @override
  String get bondCalculatorGuideStepCashBody =>
      'Primero ubica cuánto paga el bono cada año y cuánto devolverá al final.';

  @override
  String get bondCalculatorGuideStepMarketTitle =>
      '2. Define tiempo y tasa del mercado';

  @override
  String get bondCalculatorGuideStepMarketBody =>
      'Luego determina cuántos años faltan y qué rendimiento exige el inversionista.';

  @override
  String get bondCalculatorGuideStepDecisionTitle => '3. Interpreta el precio';

  @override
  String get bondCalculatorGuideStepDecisionBody =>
      'Al final compara el precio estimado con el valor a la par para saber si hay prima, descuento o equilibrio.';

  @override
  String get bondCalculatorLiveFormulaLabel => 'Sustitución en tiempo real';

  @override
  String get bondCalculatorLiveFormulaSummary =>
      'La fórmula se actualiza con tus datos mientras completas el ejercicio.';

  @override
  String get bondCalculatorInterpretationTitle => 'Cómo leer el resultado';

  @override
  String get bondCalculatorStatusLabel => 'Posición del bono';

  @override
  String get bondCalculatorStatusPremium => 'Con prima';

  @override
  String get bondCalculatorStatusAtPar => 'Cerca del valor a la par';

  @override
  String get bondCalculatorStatusDiscount => 'Con descuento';

  @override
  String get bondCalculatorCouponRateLabel => 'Tasa cupón implícita';

  @override
  String get bondCalculatorDifferenceLabel => 'Diferencia vs par';

  @override
  String bondCalculatorPremiumExplanation(
    Object couponRate,
    Object requiredReturn,
  ) {
    return 'El bono está con prima porque la tasa cupón implícita ($couponRate%) supera el rendimiento requerido ($requiredReturn%). Eso empuja el precio por encima del valor a la par.';
  }

  @override
  String bondCalculatorAtParExplanation(
    Object couponRate,
    Object requiredReturn,
  ) {
    return 'El bono está muy cerca del valor a la par porque la tasa cupón implícita ($couponRate%) es muy similar al rendimiento requerido ($requiredReturn%).';
  }

  @override
  String bondCalculatorDiscountExplanation(
    Object couponRate,
    Object requiredReturn,
  ) {
    return 'El bono está con descuento porque la tasa cupón implícita ($couponRate%) queda por debajo del rendimiento requerido ($requiredReturn%). Eso reduce el precio frente al valor a la par.';
  }

  @override
  String get shareCalculatorGuideTitle => 'Cómo pensar este modelo';

  @override
  String get shareCalculatorGuideStepModelTitle =>
      '1. Elige el modelo correcto';

  @override
  String get shareCalculatorGuideStepModelBody =>
      'Primero decide si el problema usa dividendos sin crecimiento, crecimiento constante, dos etapas o una acción preferente.';

  @override
  String get shareCalculatorGuideStepDividendTitle =>
      '2. Identifica qué dividendo te piden';

  @override
  String get shareCalculatorGuideStepDividendBody =>
      'No siempre ingresas el mismo flujo: algunos modos parten de D₁, otros de D₀ y las preferentes usan D.';

  @override
  String get shareCalculatorGuideStepInterpretTitle =>
      '3. Interpreta el precio';

  @override
  String get shareCalculatorGuideStepInterpretBody =>
      'Después de calcular, revisa qué papel juegan el crecimiento, el rendimiento requerido y, si aplica, el valor terminal.';

  @override
  String get shareCalculatorModelSectionTitle =>
      'Elige el enfoque de valuación';

  @override
  String get shareCalculatorModelSectionSummary =>
      'Cada modelo responde a un supuesto distinto sobre dividendos y crecimiento.';

  @override
  String get shareCalculatorLiveFormulaLabel => 'Sustitución en tiempo real';

  @override
  String get shareCalculatorLiveFormulaSummary =>
      'La fórmula cambia según el modelo activo y se actualiza con tus datos mientras escribes.';

  @override
  String get shareCalculatorInterpretationTitle => 'Cómo leer el resultado';

  @override
  String get shareCalculatorDividendBasisLabel => 'Dividendo usado';

  @override
  String get shareCalculatorRequiredReturnLabel => 'Rendimiento requerido';

  @override
  String get shareCalculatorSpreadLabel => 'Spread de valuación';

  @override
  String get shareCalculatorTerminalWeightLabel => 'Peso del valor terminal';

  @override
  String shareCalculatorZeroGrowthExplanation(Object requiredReturn) {
    return 'Este modelo trata la acción como una perpetuidad simple usando D₁ y un rendimiento requerido de $requiredReturn%. Funciona mejor cuando no esperas crecimiento en dividendos.';
  }

  @override
  String shareCalculatorPreferredExplanation(Object requiredReturn) {
    return 'La acción preferente se valora como una perpetuidad con dividendo fijo y un rendimiento requerido de $requiredReturn%. Aquí el flujo relevante es D, no D₀ ni D₁.';
  }

  @override
  String shareCalculatorConstantGrowthExplanation(
    Object growthRate,
    Object spread,
  ) {
    return 'El precio depende del spread entre k_s y g. Con un crecimiento de $growthRate% y un spread de $spread%, el modelo de Gordon sigue siendo válido porque k_s permanece por encima de g.';
  }

  @override
  String shareCalculatorVariableGrowthExplanation(
    Object periods,
    Object terminalGrowth,
    Object terminalWeight,
  ) {
    return 'El resultado suma dividendos proyectados durante $periods periodos y un valor terminal calculado con g₂ = $terminalGrowth%. En este caso, el valor terminal pesa aproximadamente $terminalWeight% del precio estimado.';
  }

  @override
  String get leverageCalculatorGuideTitle => 'Cómo pensar este cálculo';

  @override
  String get leverageCalculatorGuideStepModeTitle =>
      '1. Elige el tipo correcto';

  @override
  String get leverageCalculatorGuideStepModeBody =>
      'Primero decide si el problema habla de sensibilidad del EBIT frente a ventas o de sensibilidad para accionistas frente a la UAII.';

  @override
  String get leverageCalculatorGuideStepBaseTitle =>
      '2. Revisa la base sensible';

  @override
  String get leverageCalculatorGuideStepBaseBody =>
      'Luego confirma que la base del denominador siga siendo positiva. Si se acerca a cero, el riesgo sube y el grado se dispara.';

  @override
  String get leverageCalculatorGuideStepInterpretTitle =>
      '3. Interpreta la amplificación';

  @override
  String get leverageCalculatorGuideStepInterpretBody =>
      'Un grado de 2 no significa 2 dólares más: significa que un cambio porcentual de 1% se amplifica aproximadamente al doble.';

  @override
  String get leverageCalculatorModeSectionTitle =>
      'Elige el tipo de apalancamiento';

  @override
  String get leverageCalculatorModeSectionSummary =>
      'Cada modo parte de una base distinta y responde a un riesgo distinto dentro del negocio.';

  @override
  String get leverageCalculatorLiveFormulaLabel => 'Sustitución en tiempo real';

  @override
  String get leverageCalculatorLiveFormulaSummary =>
      'La fórmula se actualiza con tus datos para que veas qué entra en el numerador y qué queda como base sensible.';

  @override
  String get leverageCalculatorInterpretationTitle => 'Cómo leer el resultado';

  @override
  String get leverageCalculatorSensitivityLabel => 'Nivel de sensibilidad';

  @override
  String get leverageCalculatorSensitivityMeasured => 'Moderada';

  @override
  String get leverageCalculatorSensitivityElevated => 'Elevada';

  @override
  String get leverageCalculatorSensitivityHigh => 'Alta';

  @override
  String get leverageCalculatorContributionMarginLabel =>
      'Margen de contribución total';

  @override
  String get leverageCalculatorEbitLabel => 'EBIT estimado';

  @override
  String get leverageCalculatorCommonBaseLabel =>
      'Base disponible para comunes';

  @override
  String get leverageCalculatorTaxAdjustedPreferredLabel =>
      'Dividendos preferentes ajustados';

  @override
  String leverageCalculatorOperatingExplanation(
    Object amplification,
    Object contributionMargin,
    Object ebit,
  ) {
    return 'Con un GAO de $amplification, un cambio de 1% en ventas movería aproximadamente $amplification% el EBIT. En este ejercicio, el margen de contribución total es $contributionMargin y el EBIT estimado es $ebit.';
  }

  @override
  String leverageCalculatorFinancialExplanation(
    Object amplification,
    Object commonBase,
    Object taxAdjustedPreferred,
  ) {
    return 'Con un GAF de $amplification, un cambio de 1% en la UAII movería aproximadamente $amplification% la utilidad disponible para accionistas comunes. Aquí la base disponible para comunes es $commonBase y el ajuste fiscal de dividendos preferentes es $taxAdjustedPreferred.';
  }

  @override
  String get leaseCalculatorGuideTitle => 'Cómo pensar esta comparación';

  @override
  String get leaseCalculatorGuideStepLeaseTitle =>
      '1. Calcula el costo del lease';

  @override
  String get leaseCalculatorGuideStepLeaseBody =>
      'Convierte todas las cuotas futuras del arrendamiento a una sola cifra en valor presente.';

  @override
  String get leaseCalculatorGuideStepBuyTitle =>
      '2. Calcula el costo neto de comprar';

  @override
  String get leaseCalculatorGuideStepBuyBody =>
      'Parte del precio hoy y resta el valor residual futuro descontado para no comparar flujos en fechas distintas.';

  @override
  String get leaseCalculatorGuideStepDecisionTitle => '3. Compara y decide';

  @override
  String get leaseCalculatorGuideStepDecisionBody =>
      'La alternativa con menor valor presente es la menos costosa en términos económicos, aunque la decisión final también puede considerar flexibilidad o riesgo.';

  @override
  String get leaseCalculatorLiveFormulaLabel => 'Sustitución en tiempo real';

  @override
  String get leaseCalculatorLiveFormulaSummary =>
      'La comparación se actualiza con tus datos para que veas al mismo tiempo el costo del lease y el costo neto de comprar.';

  @override
  String get leaseCalculatorInterpretationTitle => 'Cómo leer el resultado';

  @override
  String get leaseCalculatorRecommendationLabel => 'Alternativa sugerida';

  @override
  String get leaseCalculatorRecommendationLease => 'Conviene arrendar';

  @override
  String get leaseCalculatorRecommendationBuy => 'Conviene comprar';

  @override
  String get leaseCalculatorRecommendationNeutral => 'Resultado muy parecido';

  @override
  String get leaseCalculatorDifferenceLabel => 'Ahorro relativo';

  @override
  String get leaseCalculatorResidualBenefitLabel => 'Valor residual descontado';

  @override
  String leaseCalculatorLeaseExplanation(
    Object savings,
    Object rate,
    Object residual,
  ) {
    return 'Con una tasa de descuento de $rate%, el arrendamiento consume menos valor presente por aproximadamente $savings. El valor residual descontado de la compra sería $residual, pero aun así la alternativa de lease sigue siendo más ligera en costo económico.';
  }

  @override
  String leaseCalculatorBuyExplanation(
    Object savings,
    Object rate,
    Object residual,
  ) {
    return 'Con una tasa de descuento de $rate%, comprar hoy resulta más conveniente por aproximadamente $savings. El valor residual descontado recupera cerca de $residual, y eso reduce el costo neto de compra por debajo del lease.';
  }

  @override
  String leaseCalculatorNeutralExplanation(Object rate, Object residual) {
    return 'Con una tasa de descuento de $rate% y un valor residual descontado cercano a $residual, ambas alternativas quedan muy próximas en valor presente. La decisión final puede depender de liquidez, flexibilidad o riesgo operativo.';
  }

  @override
  String get validationGrowthLessThanReturn =>
      'La tasa de crecimiento debe ser menor al rendimiento requerido.';

  @override
  String get validationPeriodsRequired =>
      'Cuando usas crecimiento variable, el número de periodos debe ser mayor que cero.';

  @override
  String get validationLeaseRequiredFields =>
      'Completa el pago del lease, los periodos, la tasa, el precio de compra y el valor residual con valores válidos.';

  @override
  String get validationLeasePeriodsRequired =>
      'El número de periodos del arrendamiento debe ser un entero positivo.';

  @override
  String get validationLeaseResidualExceedsPrice =>
      'El valor residual no debe superar el precio de compra en este análisis básico.';

  @override
  String get validationTaxRateRange =>
      'La tasa de impuestos debe estar entre 0 y ser menor que 100.';

  @override
  String get validationLeverageOperatingDenominator =>
      'El margen de contribución total debe superar los costos fijos para calcular el apalancamiento operativo.';

  @override
  String get validationLeverageFinancialDenominator =>
      'La utilidad disponible para accionistas comunes debe ser mayor que cero para calcular el apalancamiento financiero.';

  @override
  String get validationRatiosRequired =>
      'Completa todos los campos necesarios para calcular las razones financieras.';

  @override
  String get financialRatiosContinueAction => 'Continuar';

  @override
  String get financialRatiosLoadSampleAction => 'Llenar con datos de prueba';

  @override
  String get financialRatiosFormulaFallback =>
      'Selecciona un paso o una familia de razones para ver las fórmulas relevantes.';

  @override
  String get financialRatiosStatementPreviewTitle => 'Subtotales derivados';

  @override
  String get financialRatiosStatementPreviewSummary =>
      'El builder recalcula estos saldos cada vez que cambias una partida base.';

  @override
  String get financialRatiosBalancePreviewTitle => 'Comprobación contable';

  @override
  String get financialRatiosBalancePreviewSummary =>
      'Usa este bloque para revisar el cuadre y detectar inconsistencias antes de analizar.';

  @override
  String get financialRatiosNetSalesLabel => 'Ventas netas';

  @override
  String get financialRatiosNetPurchasesLabel => 'Compras netas';

  @override
  String get financialRatiosCostOfSalesLabel => 'Costo de ventas';

  @override
  String get financialRatiosGrossProfitLabel => 'Utilidad bruta';

  @override
  String get financialRatiosOperatingExpensesLabel => 'Gastos operativos';

  @override
  String get financialRatiosEbitLabel => 'EBIT';

  @override
  String get financialRatiosEarningsBeforeTaxesLabel =>
      'Utilidad antes de impuestos';

  @override
  String get financialRatiosNetIncomeLabel => 'Utilidad neta';

  @override
  String get financialRatiosCurrentAssetsLabel => 'Activos corrientes';

  @override
  String get financialRatiosFixedAssetsNetLabel => 'Activos fijos netos';

  @override
  String get financialRatiosTotalAssetsLabel => 'Activos totales';

  @override
  String get financialRatiosCurrentLiabilitiesLabel => 'Pasivos corrientes';

  @override
  String get financialRatiosNonCurrentLiabilitiesLabel =>
      'Pasivos no corrientes';

  @override
  String get financialRatiosTotalLiabilitiesLabel => 'Pasivos totales';

  @override
  String get financialRatiosEquityLabel => 'Patrimonio';

  @override
  String get financialRatiosLiabilitiesAndEquityLabel => 'Pasivos + patrimonio';

  @override
  String get financialRatiosBalanceDifferenceLabel => 'Diferencia de cuadre';

  @override
  String get financialRatiosValidationNumeric =>
      'Ingresa números válidos o deja el campo vacío si la partida es cero.';

  @override
  String get financialRatiosValidationCompleteIncomeStatement =>
      'Completa todas las partidas del estado de resultados, incluso si alguna vale 0.';

  @override
  String get financialRatiosValidationCompleteBalanceSheet =>
      'Completa todas las partidas del balance general, incluso si alguna vale 0.';

  @override
  String get financialRatiosValidationNetSalesNegative =>
      'Las ventas netas no pueden ser negativas. Revisa descuentos y devoluciones.';

  @override
  String get financialRatiosValidationNegativeCostOfSales =>
      'El costo de ventas no puede quedar negativo. Revisa inventario inicial, compras e inventario final.';

  @override
  String get financialRatiosValidationGrossProfitInconsistent =>
      'La utilidad bruta quedó inconsistente con las ventas registradas.';

  @override
  String get financialRatiosValidationOperatingIncomeInconsistent =>
      'El EBIT quedó inconsistente con la utilidad bruta y los gastos operativos.';

  @override
  String get financialRatiosValidationNetReceivablesNegative =>
      'Las cuentas por cobrar netas no pueden ser negativas. Revisa la estimación de incobrables.';

  @override
  String get financialRatiosValidationFixedAssetsNegative =>
      'Los activos fijos netos no pueden ser negativos. Revisa la depreciación acumulada.';

  @override
  String get financialRatiosValidationTotalAssetsRequired =>
      'Necesitas una base de activos positiva para generar el análisis.';

  @override
  String get financialRatiosValidationBalanceMismatch =>
      'El balance no cuadra: activos totales deben ser iguales a pasivos totales más patrimonio.';

  @override
  String get financialRatiosValidationInventoryMismatch =>
      'El inventario del balance debe coincidir con el inventario final del estado de resultados.';

  @override
  String get financialRatiosBalanceMatches =>
      'El balance cuadra correctamente: activos y fuentes de financiamiento están alineados.';

  @override
  String financialRatiosBalanceAssetsHigher(Object difference) {
    return 'Los activos superan a pasivos + patrimonio por $difference. Revisa patrimonio, deuda o el inventario final.';
  }

  @override
  String financialRatiosBalanceFundingHigher(Object difference) {
    return 'Pasivos + patrimonio superan a los activos por $difference. Revisa depreciación, cuentas por cobrar netas o patrimonio.';
  }

  @override
  String get financialRatiosMetricCurrentRatioNote =>
      'Si el pasivo corriente es cero o negativo, la liquidez corriente no se puede interpretar de forma útil.';

  @override
  String get financialRatiosMetricQuickRatioNote =>
      'La prueba ácida no aplica cuando el pasivo corriente es cero o cuando la base no representa obligaciones exigibles.';

  @override
  String get financialRatiosMetricCashRatioNote =>
      'La razón de efectivo requiere pasivos corrientes positivos para una lectura útil.';

  @override
  String get financialRatiosMetricInventoryTurnoverNote =>
      'La rotación de inventario requiere inventario positivo. Si el inventario es cero, la razón no es interpretable.';

  @override
  String get financialRatiosMetricDaysInventoryNote =>
      'Los días de inventario requieren un costo de ventas positivo para expresar permanencia en bodega.';

  @override
  String get financialRatiosMetricReceivablesTurnoverNote =>
      'La rotación de cuentas por cobrar requiere cuentas por cobrar netas positivas.';

  @override
  String get financialRatiosMetricCollectionPeriodNote =>
      'El periodo promedio de cobro requiere ventas netas positivas.';

  @override
  String get financialRatiosMetricPayablesTurnoverNote =>
      'La rotación de cuentas por pagar requiere proveedores positivos.';

  @override
  String get financialRatiosMetricPaymentPeriodNote =>
      'El periodo promedio de pago requiere un costo de ventas positivo.';

  @override
  String get financialRatiosMetricTotalAssetTurnoverNote =>
      'La rotación de activos totales requiere una base de activos positiva.';

  @override
  String get financialRatiosMetricFixedAssetTurnoverNote =>
      'La rotación de activos fijos requiere activos fijos netos positivos.';

  @override
  String get financialRatiosMetricDebtRatioNote =>
      'El índice de endeudamiento requiere activos totales positivos.';

  @override
  String get financialRatiosMetricDebtToEquityNote =>
      'Deuda a patrimonio requiere patrimonio positivo para evitar una lectura distorsionada.';

  @override
  String get financialRatiosMetricEquityMultiplierNote =>
      'El multiplicador del capital requiere patrimonio positivo.';

  @override
  String get financialRatiosMetricInterestCoverageNote =>
      'La cobertura de intereses no aplica si no hay gasto financiero positivo en el periodo.';

  @override
  String get financialRatiosMetricGrossMarginNote =>
      'El margen bruto requiere ventas netas positivas.';

  @override
  String get financialRatiosMetricOperatingMarginNote =>
      'El margen operativo requiere ventas netas positivas.';

  @override
  String get financialRatiosMetricNetMarginNote =>
      'El margen neto requiere ventas netas positivas.';

  @override
  String get financialRatiosMetricReturnOnAssetsNote =>
      'ROA requiere activos totales positivos.';

  @override
  String get financialRatiosMetricReturnOnEquityNote =>
      'ROE requiere patrimonio positivo.';

  @override
  String get financialRatiosMetricDupontNetMarginNote =>
      'El componente de margen neto requiere ventas netas positivas.';

  @override
  String get financialRatiosMetricDupontAssetTurnoverNote =>
      'El componente de rotación requiere activos totales positivos.';

  @override
  String get financialRatiosMetricDupontEquityMultiplierNote =>
      'El componente de multiplicador requiere patrimonio positivo.';

  @override
  String get financialRatiosMetricDupontRoeNote =>
      'El ROE de DuPont no se puede reconstruir mientras falte algún componente válido.';

  @override
  String get homeRouteLabel => 'Inicio';

  @override
  String get featureBondsLabel => 'Bonos';

  @override
  String get featureSharesLabel => 'Acciones';

  @override
  String get featureLeverageLabel => 'Apalancamiento';

  @override
  String get featureRatiosLabel => 'Razones financieras';

  @override
  String get featureLeaseLabel => 'Arrendamiento financiero';

  @override
  String get onboardingRouteLabel => 'Bienvenida';

  @override
  String get onboardingIndexLabel => 'Mapa del laboratorio';

  @override
  String get onboardingStatModules => 'módulos';

  @override
  String get onboardingStatCalculators => 'calculadoras';

  @override
  String get onboardingStatLanguages => 'idiomas';

  @override
  String get onboardingChipBondPricing => 'Precio de bonos';

  @override
  String get onboardingChipShareValuation => 'Valuación de acciones';

  @override
  String get onboardingChipLeverage => 'Apalancamiento';

  @override
  String get onboardingChipFinancialRatios => 'Razones financieras';

  @override
  String get onboardingChipLease => 'Arrendamiento financiero';
}
