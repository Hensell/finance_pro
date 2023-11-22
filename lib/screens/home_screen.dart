import 'package:carousel_slider/carousel_slider.dart';
import 'package:finance_pro/screens/calculator_screen.dart';
import 'package:finance_pro/screens/options/bond_screen.dart';
import 'package:finance_pro/screens/options/lease_screen.dart';
import 'package:finance_pro/screens/options/leverage_screen.dart';
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
  List<Widget> filteredCards = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Bienvenido',
        ),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        height: 190.0,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 30)),
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
                GridView.builder(
                    padding: const EdgeInsets.only(top: 15),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 6,
                    itemBuilder: (BuildContext context, int index) {
                      return buildPageForIndex(index);
                    }),
              ],
            ),
          )),
    );
  }

  Widget buildPageForIndex(int index) {
    switch (index) {
      case 0:
        return CustomCard(
          image: ImagesAssets.bono,
          title: 'Calculadora',
          backgroundColor: ColorAssets.first,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const CalculatorScreen())));
          },
        );
      case 1:
        return CustomCard(
          image: ImagesAssets.bono,
          title: 'Bono',
          backgroundColor: ColorAssets.second,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const BondScreen())));
          },
        );
      case 2:
        return CustomCard(
          image: ImagesAssets.shares,
          title: 'Acciones',
          backgroundColor: ColorAssets.third,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const ShareScreen())));
          },
        );
      case 3:
        return CustomCard(
          image: ImagesAssets.apalan,
          title: 'Apalancamiento',
          backgroundColor: ColorAssets.fourth,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const LeverageScreen())));
          },
        );
      case 4:
        return CustomCard(
          image: ImagesAssets.arren,
          title: 'Arrendamiento',
          backgroundColor: ColorAssets.sixth,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const LeaseScreen())));
          },
        );
      case 5:
        return CustomCard(
          image: ImagesAssets.razon,
          title: 'Razones financieras',
          backgroundColor: ColorAssets.seventh,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const FinancialRatiosScreen())));
          },
        );
      default:
        return Container();
    }
  }
}
