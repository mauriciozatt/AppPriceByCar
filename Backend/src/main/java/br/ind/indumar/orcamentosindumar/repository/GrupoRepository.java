package br.ind.indumar.orcamentosindumar.repository;

import br.ind.indumar.orcamentosindumar.domain.entity.GrupoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;

public interface GrupoRepository extends JpaRepository<GrupoEntity, Long> {

    Boolean existsByDescricao(String descricao);

}
