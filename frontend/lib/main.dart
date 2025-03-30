import 'package:apppricebycar/presentation/pages/gestao_veiculo_page.dart';
//import 'package:apppricebycar/presentation/pages/grupos_page.dart';
import 'package:apppricebycar/presentation/pages/home_page.dart';
import 'package:apppricebycar/presentation/pages/marca_page.dart';
import 'package:apppricebycar/presentation/pages/modelo_page.dart';
import 'package:apppricebycar/presentation/pages/potencia_page.dart';
import 'package:apppricebycar/presentation/pages/relatorio_page.dart';
import 'package:apppricebycar/presentation/pages/veiculo_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (_) => const HomePage(),
      //"grupos": (_) => const GruposPage(),
      "potencia": (_) => const PotenciaPage(),
      'marca': (_) => const MarcaPage(),
      'modelo': (_) => const ModeloPage(),
      'veiculos': (_) => const VeiculoPage(),
      'gestao_veiculos': (_) => const GestaoVeiculoPage(),
      'relatorios': (_) => const RelatorioPage(),
    },
  ));
}
