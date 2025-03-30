package br.ind.priceByCar.priceByCar.domain.entity;


import jakarta.persistence.*;
import lombok.Data;


@Entity
@Table(name = "GRUPOS")
@Data
public class GrupoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String descricao;

}
