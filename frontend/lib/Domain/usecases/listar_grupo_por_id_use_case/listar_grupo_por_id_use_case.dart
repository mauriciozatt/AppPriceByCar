import 'package:appPriceByCar/Domain/entities/grupo_entity.dart';

abstract class ListarGrupoPorIdUseCase{
  Future<GrupoEntity> call ({required int id});
}