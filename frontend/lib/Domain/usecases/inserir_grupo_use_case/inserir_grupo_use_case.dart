import 'package:apppricebycar/Domain/entities/grupo_entity.dart';

abstract class InserirGrupoUseCase {
  Future<int> call ({required GrupoEntity grupoEntity});
}