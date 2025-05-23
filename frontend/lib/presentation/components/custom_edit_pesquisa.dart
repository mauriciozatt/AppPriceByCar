import 'package:flutter/material.dart';

class CustomEditPesquisa extends StatelessWidget {
  const CustomEditPesquisa({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              labelText: 'Pesquisar',
              hintText: 'Digite aqui!',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              suffixIcon: GestureDetector(
                child: const Icon(Icons.search),
                onTap: () {
                //  print('clicouuu');
                },
                ),
            ),
          ),
        ),
      ),
    );
  }
}
