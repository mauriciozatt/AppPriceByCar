import 'package:flutter/material.dart';

class GestaoVeiculoPage extends StatefulWidget {
  const GestaoVeiculoPage({super.key});

  @override
  State<GestaoVeiculoPage> createState() => _GestaoVeiculoPageState();
}

class _GestaoVeiculoPageState extends State<GestaoVeiculoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text('Gestão de veículos'),
      ),
      body: Container(),
    );
  }
}
