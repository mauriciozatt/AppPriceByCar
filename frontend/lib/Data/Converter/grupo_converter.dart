import 'package:apppricebycar/Data/Dto/grupo_dto.dart';
import 'package:apppricebycar/Domain/entities/grupo_entity.dart';

class GrupoConverter {

  static GrupoDto toDto(GrupoEntity entity) {
    return GrupoDto(entity.descricao);
  }

  
}
