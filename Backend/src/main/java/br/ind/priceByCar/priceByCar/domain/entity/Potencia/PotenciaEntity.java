package br.ind.priceByCar.priceByCar.domain.entity.Potencia;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "potencia")
@Data
@NoArgsConstructor
public class PotenciaEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Size(max = 100)
    @NotBlank
    private String descricao;

    private Integer cavalaria;

    public PotenciaEntity(String descricao) {
        this.descricao = descricao;
    }
}
