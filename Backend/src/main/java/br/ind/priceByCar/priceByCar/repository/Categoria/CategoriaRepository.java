package br.ind.priceByCar.priceByCar.repository.Categoria;

import br.ind.priceByCar.priceByCar.domain.entity.Categoria.CategoriaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaRepository extends JpaRepository<CategoriaEntity, Integer> {

     boolean existsBydescricao (String descricao);

}
