import 'package:appPriceByCar/Domain/entities/grupo_entity.dart';

abstract class GrupoDatasource {
  Future<GrupoEntity> findById({required int id});
  Future<List<GrupoEntity>> findAll({required int page , required int size});
  Future<bool> deleteById ({required int id});
}
