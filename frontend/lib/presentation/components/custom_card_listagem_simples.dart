import 'package:flutter/material.dart';

class CustomCardListagemSimples extends StatefulWidget {
  final int id;
  final String descricao;
  final Function onEditar;
  final Function onExcluir;

  const CustomCardListagemSimples(
      {required this.id,
      required this.descricao,
      required this.onEditar,
      required this.onExcluir,
      super.key});

  @override
  State<CustomCardListagemSimples> createState() =>
      _CustomCardListagemSimplesState();
}

class _CustomCardListagemSimplesState extends State<CustomCardListagemSimples> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const StadiumBorder(
          side: BorderSide(color: Colors.black12, width: 0.5)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Nº: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(widget.id.toString()),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Descrição: ',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(widget.descricao),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton.icon(
                  label: const Text('Editar'),
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.brown)),
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    widget.onEditar(); //Aqui irá chamar o ExcluirUseCase passado como parâmetro;
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  label: const Text('Excluir'),
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    widget.onExcluir(); //Aqui irá chamar o ExcluirUseCase passado como parâmetro;
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
