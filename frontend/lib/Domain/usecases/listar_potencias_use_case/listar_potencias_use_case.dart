import 'package:apppricebycar/Domain/entities/potencia_entity.dart';

abstract class ListarPotenciasUseCase {
  Future<List<PotenciaEntity>> call({required int page, required int size});
}
