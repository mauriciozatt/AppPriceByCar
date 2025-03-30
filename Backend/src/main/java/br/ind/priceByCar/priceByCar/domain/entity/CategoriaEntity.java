package br.ind.priceByCar.priceByCar.domain.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Entity
@Table(name = "categoria")
@Data
public class CategoriaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    @Size(max = 100)
    private String descricao;

    public CategoriaEntity(String descricao){
        this.descricao = descricao;
    }
}
