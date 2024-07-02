import 'package:flutter_triple/flutter_triple.dart';
import 'package:orcamentos_indumar/Data/Datasource/grupo_datasource.dart/grupo_datasource_impl.dart';
import 'package:orcamentos_indumar/Data/Repositories/grupo_repository_impl.dart';
import 'package:orcamentos_indumar/Domain/entities/grupo_entity.dart';
import 'package:orcamentos_indumar/Domain/usecases/excluir_grupo_use_case/excluir_grupo_use_case.dart';
import 'package:orcamentos_indumar/Domain/usecases/excluir_grupo_use_case/excluir_grupo_use_case_impl.dart';
import 'package:orcamentos_indumar/Domain/usecases/listar_grupo_por_id_use_case/listar_grupo_por_id_use_case.dart';
import 'package:orcamentos_indumar/Domain/usecases/listar_grupo_por_id_use_case/listar_grupo_por_id_use_case_impl.dart';
import 'package:orcamentos_indumar/Domain/usecases/listar_grupos_use_case/listar_grupos_use_case.dart';
import 'package:orcamentos_indumar/Domain/usecases/listar_grupos_use_case/listar_grupos_use_case_impl.dart';

class GrupoController extends Store<List<GrupoEntity>> {
  GrupoController() : super([]);

  late GrupoDatasourceImpl _grupoDatasource;
  late GrupoRepositoryImpl _grupoRepository;
  late ListarGrupoPorIdUseCase _listarGrupoPorIdUseCaseImpl;
  late ListarGruposUseCase _listarGruposUseCaseImpl;
  late ExcluirGrupoUseCase _excluirGrupoUseCaseImpl;

  List<GrupoEntity> vLista = [];

  @override
  void initStore() {
    super.initStore();

    // Configurar manualmente as dependências
    _grupoDatasource = GrupoDatasourceImpl();
    _grupoRepository = GrupoRepositoryImpl(_grupoDatasource);
    _listarGrupoPorIdUseCaseImpl =
        ListarGrupoPorIdUseCaseImpl(_grupoRepository);
    _listarGruposUseCaseImpl = ListarGruposUseCaseImpl(_grupoRepository);
    _excluirGrupoUseCaseImpl = ExcluirGrupoUseCaseImpl(_grupoRepository);
  }

  void listarGrupoPorId({required int id}) async {
    setLoading(true);
    vLista = [];
    vLista.add(await _listarGrupoPorIdUseCaseImpl(id: id));
    update(vLista);
    setLoading(false);
  }

  Future<void> listarGrupos({required int page, required int size}) async {
    setLoading(true);
    vLista = [];
    vLista = await _listarGruposUseCaseImpl(page: page, size: size);
    update(vLista);
    setLoading(false);
  }

 
 Future<void> inserirGrupo(GrupoEntity grupo) async{
  setLoading(true);
  //chamo o meu usecase esse sim com retorno de um GrupoEntity
  //Vou pegar o meu retorno e add na vLista 
  //por ultímo updade na vlista...
  setLoading(false );
 }


  Future<void> excluirGrupo({required int id}) async {
    setLoading(true);
    bool vRetorno = await _excluirGrupoUseCaseImpl(id: id);
    if (vRetorno) {
      vLista.removeWhere((grupo) => grupo.id == id);
      update(vLista, force: true);
    }
    setLoading(false, force: true);
  }
}
