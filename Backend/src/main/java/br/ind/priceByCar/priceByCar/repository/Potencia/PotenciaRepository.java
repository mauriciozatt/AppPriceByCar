package br.ind.priceByCar.priceByCar.repository.Potencia;

import br.ind.priceByCar.priceByCar.domain.entity.Potencia.PotenciaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PotenciaRepository extends JpaRepository<PotenciaEntity, Integer> {

    boolean existsBydescricao (String descricao);
}
