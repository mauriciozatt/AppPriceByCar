import 'package:flutter/material.dart';

class ModeloPage extends StatefulWidget {
  const ModeloPage({super.key});

  @override
  State<ModeloPage> createState() => _ModeloPageState();
}

class _ModeloPageState extends State<ModeloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text('Cadastro de modelos'),                
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
