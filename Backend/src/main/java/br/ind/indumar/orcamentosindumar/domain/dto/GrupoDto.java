package br.ind.indumar.orcamentosindumar.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class GrupoDto {

    private Long id;

    @NotBlank
    @Size(max = 200)
    private String descricao;
}
