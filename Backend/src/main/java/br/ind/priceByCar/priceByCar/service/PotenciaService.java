package br.ind.priceByCar.priceByCar.service;


import br.ind.priceByCar.priceByCar.Converter.PotenciaConverter;
import br.ind.priceByCar.priceByCar.domain.dto.PotenciaDto;
import br.ind.priceByCar.priceByCar.domain.entity.PotenciaEntity;
import br.ind.priceByCar.priceByCar.repository.PotenciaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Optional;


@Service
public class PotenciaService {

    @Autowired
    private PotenciaRepository repository;

    public Page<PotenciaEntity> listarPotencias(Pageable pageable) {
        return repository.findAll(pageable);
    }

    public PotenciaEntity listarPOtenciaPorId(Integer id) {
        Optional<PotenciaEntity> potenciaEntityOptional = repository.findById(id);

        if (potenciaEntityOptional.isEmpty()) {
            throw new RuntimeException("Potência não encontrada!");
        } else
            return potenciaEntityOptional.get();
    }

    public Integer inserirPotencia(PotenciaDto dto) {
        if (repository.existsBydescricao(dto.descricao())) {
            throw new RuntimeException("Potência já existe cadastrada");
        } else
            return repository.save(PotenciaConverter.createEntity(dto)).getId();
    }
}























