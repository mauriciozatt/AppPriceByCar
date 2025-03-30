import 'package:apppricebycar/Domain/entities/potencia_entity.dart';

abstract class PotenciaRepository {
  Future<List<PotenciaEntity>> findAll({required int page, required int size});
}
