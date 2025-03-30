package br.ind.priceByCar.priceByCar.domain.entity.Veiculo;

import br.ind.priceByCar.priceByCar.domain.entity.Categoria.CategoriaEntity;
import br.ind.priceByCar.priceByCar.domain.entity.Modelo.ModeloEntity;
import br.ind.priceByCar.priceByCar.domain.entity.Potencia.PotenciaEntity;
import br.ind.priceByCar.priceByCar.domain.enuns.StatusVeiculo;
import br.ind.priceByCar.priceByCar.domain.enuns.TipoCombustivel;
import jakarta.persistence.*;
import jakarta.validation.constraints.Size;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "veiculo")
public class VeiculoEntity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    @Size(max = 100)
    private String descricao;

    @Column(nullable = false)
    @Size(max = 10)
    private String placa;

    @Size(max = 20)
    private String renavam;

    @Column(nullable = false)
    private Integer ano_fabricacao;

    @Column(nullable = false)
    private Integer ano_modelo;

    @Column(nullable = false)
    @Size(max = 50)
    private String cor;

    @Column(nullable = false)
    private  Integer quilometragem ;

    @Column(nullable = false)
    @Size(max = 20)
    private TipoCombustivel tipo_combustivel;

    @ManyToOne
    @JoinColumn(name = "id_categoria", nullable = false)
    private CategoriaEntity categoria;

    @ManyToOne
    @JoinColumn(name = "id_modelo", nullable = false)
    private ModeloEntity modelo;

    @ManyToOne
    @JoinColumn(name = "id_potencia", nullable = false)
    private PotenciaEntity potencia;


    @Column(precision = 10, scale = 2, nullable = false)
    private BigDecimal preco;

    @Column(precision = 10, scale = 2, nullable = false)
    private BigDecimal preco_custo;

    private boolean passagem_leilao = false;
    private boolean passagem_financiadora = false;
    private boolean passagem_locadora = false;
    @Column(nullable = false)
    private Integer num_portas;
    @Column(nullable = false)
    private LocalDateTime data_aquisicao;
    private LocalDateTime data_venda;
    @Size(max = 100)
    private String proprietario_anterior;
    private LocalDateTime garantia_valida_ate;
    @Size(max = 20)
    private StatusVeiculo status = StatusVeiculo.DISPONIVEL;
    @Column(columnDefinition = "text")
    private String observacoes;

}
