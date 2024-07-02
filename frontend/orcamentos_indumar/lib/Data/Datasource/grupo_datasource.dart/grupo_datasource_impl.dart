import 'dart:async';
import 'dart:convert';
import 'package:orcamentos_indumar/Data/Datasource/grupo_datasource.dart/grupo_datasource.dart';
import 'package:orcamentos_indumar/Domain/entities/grupo_entity.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("Request to: ${data.url}");
    print("Headers: ${data.headers}");
    print("Body: ${data.body}");
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("Response from: ${data.url}");
    print("Status code: ${data.statusCode}");
    print("Headers: ${data.headers}");
    print("Body: ${data.body}");
    return data;
  }
}

class GrupoDatasourceImpl implements GrupoDatasource {
  final client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

  @override
  Future<GrupoEntity> findById({required int id}) async {
    Uri uri = Uri.parse('http://192.168.0.106:8080/grupos/$id');
    try {
      final response = await client.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = jsonDecode(response.body);
        return GrupoEntity.fromMap(jsonMap);
      } else {
        throw Exception(
            'Erro ao buscar o grupo: $id, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erro ao buscar o grupo: $id, Exception: $e');
    }
  }

  @override
  Future<List<GrupoEntity>> findAll(
      {required int page, required int size}) async {
    Uri uri =
        Uri.parse('http://192.168.0.106:8080/grupos?page=$page&size=$size');
    try {
      final response = await client.get(
          uri); //aqui veio o json dai tem que converter para uma lista de GrupoEntity
      if (response.statusCode == 200) {
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        List<dynamic> content = responseBody[
            'content']; //content será uma lista de json("Map<String,dinamic>")

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
        throw Exception(
            'Erro ao buscar o grupos, Status Code: ${response.statusCode}');
      }
    } on Exception catch (e) {
      throw Exception('Erro ao buscar o grupos $e');
    }
  }

  @override
  Future<bool> deleteById({required int id}) async {
    Uri uri = Uri.parse('http://192.168.0.106:8080/grupos/$id');
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
}
