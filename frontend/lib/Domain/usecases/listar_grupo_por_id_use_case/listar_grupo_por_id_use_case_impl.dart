import 'package:appPriceByCar/Domain/Repositories/grupo_repository.dart';
import 'package:appPriceByCar/Domain/entities/grupo_entity.dart';
import 'package:appPriceByCar/Domain/usecases/listar_grupo_por_id_use_case/listar_grupo_por_id_use_case.dart';

class ListarGrupoPorIdUseCaseImpl implements ListarGrupoPorIdUseCase {
  final GrupoRepository grupoRepository;

  ListarGrupoPorIdUseCaseImpl(this.grupoRepository);

  @override
  Future<GrupoEntity> call({required int id}) {
    return grupoRepository.findById(id: id);
  }
}
