import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:orcamentos_indumar/Domain/entities/grupo_entity.dart';
import 'package:orcamentos_indumar/presentation/components/custom_card_listagem_simples.dart';
import 'package:orcamentos_indumar/presentation/components/custom_edit_pesquisa.dart';
import 'package:orcamentos_indumar/presentation/components/custom_form_grupo.dart';
import 'package:orcamentos_indumar/presentation/controllers/grupo_controller.dart';

class GruposPage extends StatefulWidget {
  const GruposPage({super.key});

  @override
  State<GruposPage> createState() => _GrupoState();
}

class _GrupoState extends State<GruposPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GrupoController grupoController = GrupoController();
  final TextEditingController descricaoEditingController = TextEditingController(); 


  @override
  void initState() {
    super.initState();
    initializer();
  }

  Future<void> initializer() async {
    await grupoController.listarGrupos(page: 0, size: 50);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.groups),
        title: const Text(
          'Listagem grupos',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: ScopedBuilder<GrupoController, List<GrupoEntity>>(
        store: grupoController,
        onLoading: (context) => const Center(child: CircularProgressIndicator()),
        onError: (context, error) => Center(child: Text(error.toString())),
        onState: (context, state) => Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Column(
            children: [
              const CustomEditPesquisa(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomCardListagemSimples(
                            id: state[index].id!,
                            descricao: state[index].descricao!,
                            onEditar: () {
                              //passo o meu EditarUseCase
                            },
                            onExcluir: () => grupoController.excluirGrupo(id: state[index].id!)));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown,
          child: const Icon(Icons.add),
          onPressed: () async {
            descricaoEditingController.text = '';
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Inserir grupo'),
                  content: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    /*Passo como parâmetro um controlerEdit, pois ao alterar no form a alteração e refletida para o controller de origim (passagem por referência) */
                    child: CustomFormGrupo(formKey: formKey, descricaoEditingController: descricaoEditingController),
                  ),
                  actions: [
                    ElevatedButton.icon(
                      label: const Text('Salvar'),
                       style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green) ),
                      icon: const Icon(
                        Icons.save,
                      ),
                      onPressed: () async {
                       if (formKey.currentState!.validate()) {
                        //chamo o controller.inserirGrupo();
                          Navigator.of(context).pop();
                        }                      
                      },
                    ),
                    ElevatedButton.icon(
                      style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red) ),
                        label: const Text('Cancelar'),
                        icon: const Icon(
                          Icons.cancel,
                        ),
                        onPressed: () => Navigator.pop(context))
                  ],
                );
              },
            );
          }
        ),
    );
  }
}
