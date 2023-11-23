class AccountModel {
  String accountName;
  bool isPositive;

  AccountModel(this.accountName, this.isPositive);
}

//**************************Estado de resultado */
//1) ventas
List<AccountModel> erVentas = [
  AccountModel('Ventas', true),
  AccountModel('Descuento sobre ventas', false),
  AccountModel('Devoluciones sobre ventas', false)
];

//2) costo de articulos vendidos
List<AccountModel> erCosto = [
  AccountModel('Inventario inicial', true),
  AccountModel('Compras', false),
  AccountModel('Gastos de compra', false),
  AccountModel('Descuentos sobre compras', true),
  AccountModel('Menos inventario Final ', true)
];
//3) Gastos de ventas
List<AccountModel> erGastosVentas = [
  AccountModel('Sueldos y comiciones a vendedores', false),
  AccountModel('Sueldos de la oficina de ventas', false),
  AccountModel('Víaticos', false),
  AccountModel('Fletes de mercancias recibidas', false),
  AccountModel('Depreciación de equipo de transporte', false),
  AccountModel('Teléfono', false)
];

//4) Gastos de adminitración
List<AccountModel> erGastosAdmin = [
  AccountModel('Sueldos de oficina', false),
  AccountModel('Servicios públicos', false),
  AccountModel('Depreciación del edificio', false),
  AccountModel('Depreciación de equipo de oficina', false)
];

//5) Otros ingresos
List<AccountModel> erOtrosIng = [
  AccountModel('Dividendos cobrados', false),
  AccountModel('Utilidad antes de impuestos', false),
  AccountModel('Impuestos a la utilidad', false)
];
//************************** */

//**************************Balance general*/
//1) Activo circulante
List<AccountModel> bgActivoC = [
  AccountModel('Efectivo y Valores realizables', true),
  AccountModel('Cuentas por cobrar', true),
  AccountModel('Anticipo a proveedores', true),
  AccountModel('Provisión cuentas incobrables', false),
  AccountModel('Inventarios', true)
];

//2) Activo no circulante
List<AccountModel> bgActivoNC = [
  AccountModel('nmuebles Maquinaria y Equipo', true),
  AccountModel('Depreciación acumulada', false)
];

//3) Pasivo circulante
List<AccountModel> bgPasivoC = [
  AccountModel('Proveedores', true),
  AccountModel('Acreedores Bancarios corto plazo', true),
  AccountModel('Impuestos por pagar', true)
];

//4) Pasivo no circulante
List<AccountModel> bgPasivoNC = [
  AccountModel('Documentos x pagar LP', true),
  AccountModel('Acreedores Hipotecarios', true),
  AccountModel('Obligaciones', true)
];

//5) Capital contable
List<AccountModel> bgCapitalCon = [
  AccountModel('Capital social', true),
  AccountModel('Reserva legal', true),
  AccountModel('Reserva de reinversión', true),
  AccountModel('Utilidad de ejercicios anteriores', true),
];
//************************** */

List<List<AccountModel>> balanceGeneralList = [
  bgActivoC,
  bgActivoNC,
  bgPasivoC,
  bgPasivoNC,
  bgCapitalCon
];
