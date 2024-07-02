import 'package:appPriceByCar/presentation/pages/grupos_page.dart';
import 'package:appPriceByCar/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.brown,
      appBarTheme: const AppBarTheme(color: Colors.brown),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.brown),
          foregroundColor: WidgetStateProperty.all(
              Colors.white), 
        ),
      ),
    ),
    title: 'Orçamentos Ind',
    routes: {
      "/": (_) => const HomePage(),
      "grupos": (_) => const GruposPage()

      //"categorias": (_) => const CategoriasPage()
      //"espefificacoes": (_) => const EspeficaoesPage()
      //"adicionais": (_) => const AdicionaisPage()
    },
  ));
}
