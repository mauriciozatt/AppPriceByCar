import 'package:appPriceByCar/Data/Datasource/grupo_datasource.dart/grupo_datasource.dart';
import 'package:appPriceByCar/Domain/Repositories/grupo_repository.dart';
import 'package:appPriceByCar/Domain/entities/grupo_entity.dart';

class GrupoRepositoryImpl implements GrupoRepository {
  final GrupoDatasource grupoDataSource;

  GrupoRepositoryImpl(this.grupoDataSource);

  @override
  Future<GrupoEntity> findById({required int id}) async {
    return await grupoDataSource.findById(id: id);
  }

  @override
  Future<List<GrupoEntity>> findAll({required int page, required int size}) async{
    return await grupoDataSource.findAll(page: page, size: size);
  }

  @override
  Future<bool> deleteById({required int id}) async {
      return await grupoDataSource.deleteById(id: id);
  }
}
