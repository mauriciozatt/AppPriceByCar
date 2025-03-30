import 'package:apppricebycar/Domain/Repositories/potencia_repository.dart';
import 'package:apppricebycar/Domain/entities/potencia_entity.dart';
import 'package:apppricebycar/Domain/usecases/listar_potencias_use_case/listar_potencias_use_case.dart';

class ListarPotenciasUseCaseImpl implements ListarPotenciasUseCase {
  final PotenciaRepository _potenciaRepository;

  ListarPotenciasUseCaseImpl(this._potenciaRepository);

  @override
  Future<List<PotenciaEntity>> call({required int page, required int size}) async {
    return await _potenciaRepository.findAll(page: page, size: size);
  }
}
