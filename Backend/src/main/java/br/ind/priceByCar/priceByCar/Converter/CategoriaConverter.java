package br.ind.priceByCar.priceByCar.Converter;

import br.ind.priceByCar.priceByCar.domain.dto.CategoriaDto;
import br.ind.priceByCar.priceByCar.domain.entity.CategoriaEntity;

public class CategoriaConverter {

    public static CategoriaEntity toEntity(CategoriaDto dto){
      return new CategoriaEntity(dto.getDescricao());
    }
}
