class AccountModel {
  String accountName;
  bool isPositive;
  String type;
  double value;

  AccountModel(this.accountName, this.isPositive, this.type, [double? value])
      : value = value ?? 0.0;
}

//**************************Estado de resultado */
//1) ventas
List<AccountModel> erVentas = [
  AccountModel('Ventas', true, 'er'),
  AccountModel('Descuento sobre ventas', false, 'er'),
  AccountModel('Devoluciones sobre ventas', false, 'er')
];

//2) costo de articulos vendidos
List<AccountModel> erCosto = [
  AccountModel('Inventario inicial', true, 'er'),
  AccountModel('Compras', false, 'er'),
  AccountModel('Gastos de compra', false, 'er'),
  AccountModel('Descuentos sobre compras', true, 'er'),
  AccountModel('Menos inventario Final ', true, 'er')
];
//3) Gastos de ventas
List<AccountModel> erGastosVentas = [
  AccountModel('Sueldos y comiciones a vendedores', false, 'er'),
  AccountModel('Sueldos de la oficina de ventas', false, 'er'),
  AccountModel('Víaticos', false, 'er'),
  AccountModel('Fletes de mercancias recibidas', false, 'er'),
  AccountModel('Depreciación de equipo de transporte', false, 'er'),
  AccountModel('Teléfono', false, 'er')
];

//4) Gastos de adminitración
List<AccountModel> erGastosAdmin = [
  AccountModel('Sueldos de oficina', false, 'er'),
  AccountModel('Servicios públicos', false, 'er'),
  AccountModel('Depreciación del edificio', false, 'er'),
  AccountModel('Depreciación de equipo de oficina', false, 'er')
];

//5) Otros ingresos
List<AccountModel> erOtrosIng = [
  AccountModel('Dividendos cobrados', false, 'er'),
  AccountModel('Utilidad antes de impuestos', false, 'er'),
  AccountModel('Impuestos a la utilidad', false, 'er')
];
//************************** */

//**************************Balance general*/
//1) Activo circulante
List<AccountModel> bgActivoC = [
  AccountModel('Efectivo y Valores realizables', true, 'bg'),
  AccountModel('Cuentas por cobrar', true, 'bg'),
  AccountModel('Anticipo a proveedores', true, 'bg'),
  AccountModel('Provisión cuentas incobrables', false, 'bg'),
  AccountModel('Inventarios', true, 'bg')
];

List<AccountModel> bgActivoNC = [
  AccountModel('Muebles Maquinaria y Equipo', true, 'bg'),
  AccountModel('Depreciación acumulada', false, 'bg')
];

List<AccountModel> bgPasivoC = [
  AccountModel('Proveedores', true, 'bg'),
  AccountModel('Acreedores Bancarios corto plazo', true, 'bg'),
  AccountModel('Impuestos por pagar', true, 'bg')
];

List<AccountModel> bgPasivoNC = [
  AccountModel('Documentos por pagar LP', true, 'bg'),
  AccountModel('Acreedores Hipotecarios', true, 'bg'),
  AccountModel('Obligaciones', true, 'bg')
];

List<AccountModel> bgCapitalCon = [
  AccountModel('Capital social', true, 'bg'),
  AccountModel('Reserva legal', true, 'bg'),
  AccountModel('Reserva de reinversión', true, 'bg'),
  AccountModel('Utilidad de ejercicios anteriores', true, 'bg'),
];

//************************** */

List<List<AccountModel>> balanceGeneralList = [
  bgActivoC,
  bgActivoNC,
  bgPasivoC,
  bgPasivoNC,
  bgCapitalCon
];
