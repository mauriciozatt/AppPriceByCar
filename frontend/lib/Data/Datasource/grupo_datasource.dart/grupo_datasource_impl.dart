import 'dart:async';
import 'dart:convert';
import 'package:apppricebycar/Data/Converter/grupo_converter.dart';
import 'package:apppricebycar/Data/Datasource/grupo_datasource.dart/grupo_datasource.dart';
import 'package:apppricebycar/Data/Datasource/intercept/BasicInterceptor.dart';
import 'package:apppricebycar/Data/Dto/grupo_dto.dart';
import 'package:apppricebycar/Domain/entities/grupo_entity.dart';
import 'package:http_interceptor/http_interceptor.dart';


class GrupoDatasourceImpl implements GrupoDatasource {
  final client = HttpClientWithInterceptor.build(interceptors: [BasicInterceptor()]);

  @override
  Future<GrupoEntity> findById({required int id}) async {
    Uri uri = Uri.parse('http://192.168.3.10:8080/grupos/$id');
    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return GrupoEntity.fromMap(jsonMap);
      } else {
        throw Exception('Erro ao buscar o grupo: $id, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar o grupo: $id, Exception: $e');
    }
  }

  @override
  Future<List<GrupoEntity>> findAll(
      {required int page, required int size}) async {
    Uri uri = Uri.parse('http://192.168.3.10:8080/grupos?page=$page&size=$size');
    try {
      final response = await client.get(uri); //aqui veio o json dai tem que converter para uma lista de GrupoEntity
      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = jsonDecode(response.body);
        List<dynamic> content = mapResponse['content']; //content será uma lista de json("Map<String,dinamic>")

        List<GrupoEntity> grupos = [];

        for (var item in content) {
          Map<String, dynamic> map =
              item; //verifica se item já não vem aqui como um map.
          grupos.add(GrupoEntity.fromMap(map));
        }

        //Momento não vou usar...
        //  int totalPages = responseBody['totalPages'];
        //  int totalElements = responseBody['totalElements'];
        //  bool last = responseBody['last'];
        //  bool first = responseBody['first'];

        return grupos;

        //Como content será uma lista de Map posso chamar o método .map da lista que irá interrar sobre cada elemento da lista que é um Map!
        //Em seguida converto cada elemento de Map para GrupoEntity
        //List<GrupoEntity> grupos = content.map((item) => GrupoEntity.fromMap(item)).toList();
        //return grupos;
      } else {
        throw Exception('Erro ao buscar o grupos, Status Code: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Erro ao buscar o grupos $e');
    }
  }

  @override
  Future<bool> deleteById({required int id}) async {
    Uri uri = Uri.parse('http://192.168.3.10:8080/grupos/$id');
    try {
      final remote = await client.delete(uri);
      if (remote.statusCode == 204) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      throw Exception('Erro ao excluir grupo: $e');
    }
  }

  @override
  Future<int> insert({required GrupoEntity grupoEntity}) async {
    Uri uri = Uri.parse('http://192.168.3.10:8080/grupos');
    final GrupoDto dto = GrupoConverter.toDto(grupoEntity);
    try {
      var vBody = jsonEncode(dto.toMap());
      final remote = await client.post(uri,
      headers: {'Content-Type': 'application/json'},
      body: vBody);
      if (remote.statusCode == 201) {
        return int.parse(remote.body);
      } else {
        throw Exception('Erro ao inserir grupo!');
      }
    } on Exception catch (e) {
      throw Exception('Erro: $e');
    }
  }
}
