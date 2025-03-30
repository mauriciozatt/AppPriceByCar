package br.ind.priceByCar.priceByCar.Converter.Potencia;

import br.ind.priceByCar.priceByCar.domain.dto.Potencia.PotenciaDto;
import br.ind.priceByCar.priceByCar.domain.entity.Potencia.PotenciaEntity;

public class PotenciaConverter {

    public static PotenciaEntity createEntity(PotenciaDto dto) {
        return new PotenciaEntity(dto.descricao());
    }
}
