package br.ind.priceByCar.priceByCar.service;

import br.ind.priceByCar.priceByCar.domain.dto.GrupoDto;
import br.ind.priceByCar.priceByCar.domain.entity.GrupoEntity;
import br.ind.priceByCar.priceByCar.repository.GrupoRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class GrupoService {

    private final GrupoRepository grupoRepository;

    public GrupoService(GrupoRepository grupoRepository) {
        this.grupoRepository = grupoRepository;
    }


    public Integer inserirGrupo(GrupoDto grupoDto) {
        //Válida se já não existe um grupo com essa descricao se não existi cadastro senão except

        if (grupoRepository.existsByDescricao(grupoDto.getDescricao())) {
            throw new RuntimeException("Já existe um grupo com esse nome");
        }


        GrupoEntity grupo = new GrupoEntity();
        grupo.setDescricao(grupoDto.getDescricao());

        GrupoEntity retorno = grupoRepository.save(grupo);
        return retorno.getId();
    }

    public Page<GrupoEntity> buscarGrupos(Pageable pageable) {
        try {
            return grupoRepository.findAll(pageable);
        } catch (Exception e) {
            throw new RuntimeException("Erro ao buscar grupos: " + e.getMessage());
        }
    }


    public GrupoEntity buscarGrupoPorId(Integer id) {

        Optional<GrupoEntity> optionalGrupoEntity = grupoRepository.findById(id);

        if (optionalGrupoEntity.isPresent()) {
            return optionalGrupoEntity.get();
        } else
            throw new RuntimeException("Grupo " + id + " não encontrado");
    }

    public ResponseEntity deletarGrupoPorId(Integer id) {
        if (grupoRepository.existsById(id)) {
            grupoRepository.deleteById(id);
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.badRequest().build();
    }
}
