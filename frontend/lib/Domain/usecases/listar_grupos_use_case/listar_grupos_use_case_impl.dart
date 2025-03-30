import 'package:apppricebycar/Domain/Repositories/grupo_repository.dart';
import 'package:apppricebycar/Domain/entities/grupo_entity.dart';
import 'package:apppricebycar/Domain/usecases/listar_grupos_use_case/listar_grupos_use_case.dart';

class ListarGruposUseCaseImpl implements ListarGruposUseCase {
  final GrupoRepository grupoRepository;

  ListarGruposUseCaseImpl(this.grupoRepository);

  @override
  Future<List<GrupoEntity>> call({required int page, required int size}) async {
    return await grupoRepository.findAll(page: page, size: size);
  }
}
