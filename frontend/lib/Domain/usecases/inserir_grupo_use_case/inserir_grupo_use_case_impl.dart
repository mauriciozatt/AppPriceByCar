import 'package:apppricebycar/Domain/Repositories/grupo_repository.dart';
import 'package:apppricebycar/Domain/entities/grupo_entity.dart';
import 'package:apppricebycar/Domain/usecases/inserir_grupo_use_case/inserir_grupo_use_case.dart';

class InserirGrupoUseCaseImpl implements InserirGrupoUseCase {
  final GrupoRepository grupoRepository;

  InserirGrupoUseCaseImpl(this.grupoRepository);
  
  @override
  Future<int> call({required GrupoEntity grupoEntity}) async {
    return await grupoRepository.insert(grupoEntity: grupoEntity);
  }


}
