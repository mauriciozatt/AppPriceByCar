import 'package:apppricebycar/Data/Datasource/potencia_datasource/potencia_datasource.dart';
import 'package:apppricebycar/Domain/Repositories/potencia_repository.dart';
import 'package:apppricebycar/Domain/entities/potencia_entity.dart';

class PotenciaRepositoryImpl implements PotenciaRepository {
  final PotenciaDatasource _potenciaDatasource;

  PotenciaRepositoryImpl(this._potenciaDatasource);

  @override
  Future<List<PotenciaEntity>> findAll({required int page, required int size}) async {
    try {
      return await _potenciaDatasource.findAll(page: page, size: size);
    } on Exception catch (e) {
      throw Exception('Erro ao buscar potências. Erro: $e');
    }
  }
}
