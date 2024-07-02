import 'package:appPriceByCar/Domain/Repositories/grupo_repository.dart';
import 'package:appPriceByCar/Domain/entities/grupo_entity.dart';
import 'package:appPriceByCar/Domain/usecases/listar_grupos_use_case/listar_grupos_use_case.dart';

class ListarGruposUseCaseImpl implements ListarGruposUseCase {
  final GrupoRepository grupoRepository;

  ListarGruposUseCaseImpl(this.grupoRepository);

  @override
  Future<List<GrupoEntity>> call({required int page, required int size}) {
    return grupoRepository.findAll(page: page, size: size);
  }
}
