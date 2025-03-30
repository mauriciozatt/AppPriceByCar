package br.ind.priceByCar.priceByCar.domain.dto.Potencia;

import jakarta.validation.constraints.NotBlank;

public record PotenciaDto(@NotBlank String descricao, Integer cavalaria) {}
