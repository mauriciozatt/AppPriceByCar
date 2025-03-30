package br.ind.priceByCar.priceByCar.Converter;

import br.ind.priceByCar.priceByCar.domain.dto.PotenciaDto;
import br.ind.priceByCar.priceByCar.domain.entity.PotenciaEntity;

public class PotenciaConverter {

    public static PotenciaEntity createEntity(PotenciaDto dto) {
        return new PotenciaEntity(dto.descricao());
    }
}
