import 'dart:convert';
import 'package:apppricebycar/Data/Datasource/intercept/BasicInterceptor.dart';
import 'package:apppricebycar/Data/Datasource/potencia_datasource/potencia_datasource.dart';
import 'package:apppricebycar/Domain/entities/potencia_entity.dart';
import 'package:http_interceptor/http_interceptor.dart';

class PotenciaDatasourceImpl implements PotenciaDatasource {
  final client =
      HttpClientWithInterceptor.build(interceptors: [BasicInterceptor()]);

  @override
  Future<List<PotenciaEntity>> findAll({required int page, required int size}) async {
    List<PotenciaEntity> vListaPotencias = [];
    final response = await client.get(Uri.parse('http://192.168.3.10:8080/potencia?page=$page&size=$size'));

    if (response.statusCode == 200) {
      Map<String, dynamic> meuJsonCompleto = jsonDecode(response.body);
      List<Map<String, dynamic>> content = meuJsonCompleto['content'];

      //poderia ter feito com for, mas assim e mais clean...
      //Como content será uma lista de Map posso chamar o método .map da lista que irá interrar sobre cada elemento da lista que é um Map!
      //Em seguida converto cada elemento de Map para PotenciaEntity
      vListaPotencias = content.map((e) => PotenciaEntity.fromMap(e)).toList();
    }

    return vListaPotencias;
  }
}
