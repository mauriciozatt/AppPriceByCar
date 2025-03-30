package br.ind.priceByCar.priceByCar.repository;

import br.ind.priceByCar.priceByCar.domain.entity.GrupoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface GrupoRepository extends JpaRepository<GrupoEntity, Integer> {

    Boolean existsByDescricao(String descricao);

}
