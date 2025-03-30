package br.ind.priceByCar.priceByCar.domain.dto;

import jakarta.validation.constraints.NotBlank;

public record PotenciaDto(@NotBlank String descricao, Integer cavalaria) {}
