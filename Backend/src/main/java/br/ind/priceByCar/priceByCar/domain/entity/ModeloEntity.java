package br.ind.priceByCar.priceByCar.domain.entity;


import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "modelo")
public class ModeloEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    @Size(max = 100)
    private String descricao;

    @ManyToOne
    @JoinColumn(name = "id_marca", nullable = false)
    private MarcaEntity marca;

}
