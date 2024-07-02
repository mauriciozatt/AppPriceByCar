package br.ind.indumar.orcamentosindumar.domain.entity;


import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "GRUPOS")
@Data
public class GrupoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String descricao;

}
