import 'package:apppricebycar/presentation/components/custom_edit_pesquisa.dart';
import 'package:apppricebycar/presentation/controllers/potencia_controller.dart';
import 'package:flutter/material.dart';

class PotenciaPage extends StatefulWidget {
  const PotenciaPage({super.key});

  @override
  State<PotenciaPage> createState() => _PotenciaPageState();
}

class _PotenciaPageState extends State<PotenciaPage> {
  final _scrollController = ScrollController();
  final PotenciaController _controller = PotenciaController();
  final int _page = 1; 

  @override
  void initState(){
    super.initState();
    initializer();
  }


  void initializer() {
    _controller.listarPotencias(page: _page, size: 10);
    
    _scrollController.addListener (
      () async {
        if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
         await _controller.listarPotencias(page: _page + 1, size: 10); 
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text(
          'Cadastro de Potências',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const CustomEditPesquisa(),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _controller.loadingManager.isLoanding,
                  builder: (context, value, child) {
                  if (value) {
                    return const Center(child: CircularProgressIndicator(color: Colors.blue,));
                  } else {
                    return ListView.builder(
                      controller: _scrollController,
                      itemCount: _controller.potencias.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Dismissible(
                            key: ValueKey(_controller.potencias[index].id),
                            onDismissed: (direction) {
                              //chamar o usaCase de delete...
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text('Potência X excluida com sucesso!'),
                                duration: Duration(seconds: 1),
                                showCloseIcon: true,
                              ));
                            },
                            background: Container(
                              color: Colors.red,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 16.0),
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 5,
                              color: Colors.white,
                              child:  Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Descrição:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            'Valor:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          Text(
                                            'Cavalaria:',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${_controller.potencias[index].descricao}',
                                            style: const TextStyle(fontSize: 14),
                                          ),                               
                                            Text('${_controller.potencias[index].valor}',
                                            style: const TextStyle(fontSize: 14),
                                          ),                               
                                           Text('${_controller.potencias[index].cavalaria}',
                                            style: const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              )),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade600,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
