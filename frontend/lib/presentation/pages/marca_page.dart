import 'package:flutter/material.dart';

class MarcaPage extends StatefulWidget {
  const MarcaPage({super.key});

  @override
  State<MarcaPage> createState() => _MarcaPageState();
}

class _MarcaPageState extends State<MarcaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text('Cadastro de marcas'),                
      ),
      body: Container(),
      floatingActionButton:
          FloatingActionButton(
            backgroundColor: Colors.blue.shade400,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add), 
            onPressed: () {}
          ),
    );
  }
}
