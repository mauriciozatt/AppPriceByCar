import 'package:orcamentos_indumar/Domain/entities/grupo_entity.dart';

abstract class ListarGruposUseCase {
  Future<List<GrupoEntity>> call({required int page, required int size});
}
