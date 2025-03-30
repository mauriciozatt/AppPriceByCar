import 'package:apppricebycar/Domain/entities/potencia_entity.dart';

abstract class PotenciaDatasource {
  Future<List<PotenciaEntity>> findAll({required int page, required int size});
}
