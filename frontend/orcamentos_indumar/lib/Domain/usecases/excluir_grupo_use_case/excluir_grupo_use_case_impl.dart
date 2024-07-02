import 'package:orcamentos_indumar/Domain/Repositories/grupo_repository.dart';
import 'package:orcamentos_indumar/Domain/usecases/excluir_grupo_use_case/excluir_grupo_use_case.dart';

class ExcluirGrupoUseCaseImpl implements ExcluirGrupoUseCase {
  final GrupoRepository _grupoRepository;

  ExcluirGrupoUseCaseImpl(this._grupoRepository);

  @override
  Future<bool> call({required int id}){
   return _grupoRepository.deleteById(id: id);
  }
}