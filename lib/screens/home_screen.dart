import 'package:carousel_slider/carousel_slider.dart';
import 'package:finance_pro/screens/calculator_screen.dart';
import 'package:finance_pro/screens/construcction_screen.dart';
import 'package:finance_pro/screens/content/bond_screen.dart';
import 'package:finance_pro/screens/content/leverage_screen.dart';
import 'package:finance_pro/screens/options/financial_ratios_screen.dart';
import 'package:finance_pro/screens/options/share_screen.dart';
import 'package:finance_pro/utils/colors_assets.dart';
import 'package:finance_pro/utils/images_assets.dart';
import 'package:finance_pro/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final TextEditingController _searchController = TextEditingController();
  List<Widget> filteredCards = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO hacer la funcionalidad de busqueda por medio de la creción de un modelo.
              /*  TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                    hintText: '¿Qué concepto financiero buscas?',
                    prefixIcon: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 15.0),
                        child: Icon(Icons.search)),
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(45))),
              ),*/
              CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1,
                      height: 190.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5)),
                  items: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.9),
                                BlendMode.darken),
                            image: const AssetImage(ImagesAssets.carousel1),
                            fit: BoxFit.cover,
                          )),
                      child: const Column(
                        children: [
                          Text(
                            'Deuda y capital patrimonial',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '\nTanto el capital de deuda como el capital patrimonial son fuentes externas de financiamiento que utilizan las empresas; sin embargo, tienen diferencias importantes en vários aspectos.',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.9),
                                BlendMode.darken),
                            image: const AssetImage(ImagesAssets.carousel2),
                            fit: BoxFit.cover,
                          )),
                      child: const Column(
                        children: [
                          Text(
                            'Voz en la administración',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '\nA diferencia de los acreedores, los tenedores de capital patrimonial (accionistas) son los propietarios de la empresa.',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.justify,
                          )
                        ],
                      ),
                    )
                  ]),
              const Padding(
                padding: EdgeInsetsDirectional.only(top: 15),
                child: Text(
                  'Glosario de Términos',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  direction: MediaQuery.of(context).size.width < 400
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    CustomCard(
                      image: ImagesAssets.bono,
                      title: 'Calculadora',
                      backgroundColor: ColorAssets.first,
                      light: false,
                      margin: const EdgeInsets.all(5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const CalculatorScreen())));
                      },
                    ),
                    CustomCard(
                      image: ImagesAssets.bono,
                      title: 'Bono',
                      backgroundColor: ColorAssets.first,
                      light: false,
                      margin: const EdgeInsets.all(5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const BondScreen())));
                      },
                    ),
                    CustomCard(
                      image: ImagesAssets.shares,
                      title: 'Acciones',
                      backgroundColor: ColorAssets.second,
                      light: false,
                      margin: const EdgeInsets.all(5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const ShareScreen())));
                      },
                    ),
                    CustomCard(
                      image: ImagesAssets.apalan,
                      title: 'Apalancamiento',
                      backgroundColor: ColorAssets.third,
                      light: false,
                      margin: const EdgeInsets.all(5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const LeverageScreen())));
                      },
                    ),
                    CustomCard(
                      image: ImagesAssets.arren,
                      title: 'Arrendamiento',
                      backgroundColor: ColorAssets.fourth,
                      light: false,
                      margin: const EdgeInsets.all(5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const ConstrucctionScreen())));
                      },
                    ),
                    CustomCard(
                      image: ImagesAssets.razon,
                      title: 'Razones financieras',
                      backgroundColor: ColorAssets.fourth,
                      light: false,
                      margin: const EdgeInsets.all(5),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const FinancialRatiosScreen())));
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
