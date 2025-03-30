package br.ind.priceByCar.priceByCar.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class GrupoDto {

    @NotBlank
    @Size(max = 200)
    private String descricao;
}
