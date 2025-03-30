import 'package:apppricebycar/Data/Datasource/grupo_datasource.dart/grupo_datasource_impl.dart';
import 'package:apppricebycar/Data/Repositories/grupo_repository_impl.dart';
import 'package:apppricebycar/Domain/entities/grupo_entity.dart';
import 'package:apppricebycar/Domain/usecases/excluir_grupo_use_case/excluir_grupo_use_case.dart';
import 'package:apppricebycar/Domain/usecases/excluir_grupo_use_case/excluir_grupo_use_case_impl.dart';
import 'package:apppricebycar/Domain/usecases/inserir_grupo_use_case/inserir_grupo_use_case.dart';
import 'package:apppricebycar/Domain/usecases/inserir_grupo_use_case/inserir_grupo_use_case_impl.dart';
import 'package:apppricebycar/Domain/usecases/listar_grupo_por_id_use_case/listar_grupo_por_id_use_case.dart';
import 'package:apppricebycar/Domain/usecases/listar_grupo_por_id_use_case/listar_grupo_por_id_use_case_impl.dart';
import 'package:apppricebycar/Domain/usecases/listar_grupos_use_case/listar_grupos_use_case.dart';
import 'package:apppricebycar/Domain/usecases/listar_grupos_use_case/listar_grupos_use_case_impl.dart';
import 'package:flutter_triple/flutter_triple.dart';

class GrupoController extends Store<List<GrupoEntity>> {
  GrupoController() : super([]);

  late GrupoDatasourceImpl _grupoDatasource;
  late GrupoRepositoryImpl _grupoRepository;
  late ListarGrupoPorIdUseCase _listarGrupoPorIdUseCaseImpl;
  late ListarGruposUseCase _listarGruposUseCaseImpl;
  late ExcluirGrupoUseCase _excluirGrupoUseCaseImpl;
  late InserirGrupoUseCase _inserirGrupoUseCaseImpl;

  List<GrupoEntity> vLista = [];

  @override
  void initStore() {
    super.initStore();

    // Configurar manualmente as dependências
    _grupoDatasource = GrupoDatasourceImpl();
    _grupoRepository = GrupoRepositoryImpl(_grupoDatasource);
    _listarGrupoPorIdUseCaseImpl = ListarGrupoPorIdUseCaseImpl(_grupoRepository);
    _listarGruposUseCaseImpl = ListarGruposUseCaseImpl(_grupoRepository);
    _excluirGrupoUseCaseImpl = ExcluirGrupoUseCaseImpl(_grupoRepository);
    _inserirGrupoUseCaseImpl = InserirGrupoUseCaseImpl(_grupoRepository);
  }

  void listarGrupoPorId({required int id}) async {
    setLoading(true);
    vLista = [];
    vLista.add(await _listarGrupoPorIdUseCaseImpl(id: id));
    update(vLista);
    setLoading(false);
  }

  Future<void> listarGrupos() async {
    setLoading(true);
    final vRetorno = await _listarGruposUseCaseImpl(page: 0, size: 50);
    if (vRetorno.isNotEmpty) {
      vRetorno.forEach((e) => vLista.add(e));
      update(vLista, force: true);
    }
    setLoading(false);
  }

  Future<void> carregarMaisGrupos(
      {required int page, required int size}) async {
    final vRetorno = await _listarGruposUseCaseImpl(page: page, size: size);
    if (vRetorno.isNotEmpty) {
      vRetorno.forEach((e) => vLista.add(e));
      update(vLista, force: true);
    }
  }



Future<bool> inserirGrupo(GrupoEntity grupoEntity) async {  
    int idRetorno = await _inserirGrupoUseCaseImpl(grupoEntity: grupoEntity);

    if (idRetorno > 0) {
      GrupoEntity grupo = await _listarGrupoPorIdUseCaseImpl(id: idRetorno);
      vLista.add(grupo);
      update(vLista, force:  true);
      return true;
    } else {
      return false;
    }
  }
 

  Future<bool> excluirGrupo({required int id}) async {
    setLoading(true);
    bool vRetorno = await _excluirGrupoUseCaseImpl(id: id);
    if (vRetorno) {
      vLista.removeWhere((grupo) => grupo.id == id);
      update(vLista, force: true);
    }
    setLoading(false, force: true);
    return vRetorno;
  }
}
