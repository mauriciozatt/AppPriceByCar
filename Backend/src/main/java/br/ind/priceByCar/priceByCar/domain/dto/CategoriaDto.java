package br.ind.priceByCar.priceByCar.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class CategoriaDto {

    @NotBlank
    @Size(max = 100)
    private String descricao;
}
