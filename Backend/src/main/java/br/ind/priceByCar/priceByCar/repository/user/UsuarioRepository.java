package br.ind.priceByCar.priceByCar.repository.user;

import br.ind.priceByCar.priceByCar.domain.entity.user.UsuarioEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UsuarioRepository extends JpaRepository<UsuarioEntity, Integer> {

    UsuarioEntity findByUsername(String username);
}
