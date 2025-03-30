package br.ind.priceByCar.priceByCar.Converter.Categoria;

import br.ind.priceByCar.priceByCar.domain.dto.Categoria.CategoriaDto;
import br.ind.priceByCar.priceByCar.domain.entity.Categoria.CategoriaEntity;

public class CategoriaConverter {

    public static CategoriaEntity toEntity(CategoriaDto dto){
      return new CategoriaEntity(dto.getDescricao());
    }
}
