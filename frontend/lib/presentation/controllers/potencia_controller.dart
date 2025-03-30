import 'package:apppricebycar/Data/Datasource/potencia_datasource/potencia_datasource_impl.dart';
import 'package:apppricebycar/Data/Repositories/potencia_repository_impl.dart';
import 'package:apppricebycar/Domain/entities/potencia_entity.dart';
import 'package:apppricebycar/Domain/usecases/listar_potencias_use_case/listar_potencias_use_case_impl.dart';
import 'package:apppricebycar/presentation/components/loading_manager.dart';

class PotenciaController {
  final LoadingManager loadingManager = LoadingManager();
   List<PotenciaEntity> potencias = [];

  late final PotenciaDatasourceImpl _potenciaDatasource;
  late final PotenciaRepositoryImpl _potenciaRepository;
  late final ListarPotenciasUseCaseImpl _listarPotenciasUseCase;

  PotenciaController() {
    _potenciaDatasource = PotenciaDatasourceImpl();
    _potenciaRepository = PotenciaRepositoryImpl(_potenciaDatasource);
    _listarPotenciasUseCase = ListarPotenciasUseCaseImpl(_potenciaRepository);
  }

  Future<void> listarPotencias({required int page, required int size}) async {
    loadingManager.setLoanding(true);
    potencias.addAll(await _listarPotenciasUseCase(page: page, size: size));

//    for (var e in potencias) {
//      print('id ${e.id} descricao ${e.descricao}');
//    }

    potencias.forEach((e) => print('id ${e.id} descricao ${e.descricao}'));

    loadingManager.setLoanding(false);
  }
}
