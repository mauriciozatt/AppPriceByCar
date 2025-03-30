import 'package:apppricebycar/presentation/components/card_bem_vindo.dart';
import 'package:apppricebycar/presentation/components/card_veiculos_venda_component.dart';
import 'package:flutter/material.dart';
import 'package:apppricebycar/presentation/components/drawer_initial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerInitialPage(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text(
          "PriceByCar",
          style: TextStyle(
            fontFamily: 'FontePersonalizada1',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
       // decoration: const BoxDecoration(
        //  image: DecorationImage(
        //    image: AssetImage('assets/img/img3.jpg'),
        //    alignment: Alignment.topCenter,
        //    fit: BoxFit.cover,
        //    opacity: 0.1,
        //  ),
        //),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: CardBemVindo(),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 60),
                    child: CardVeiculosVendaComponent(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
