package br.ind.priceByCar.priceByCar.service.Categoria;

import br.ind.priceByCar.priceByCar.Converter.Categoria.CategoriaConverter;
import br.ind.priceByCar.priceByCar.domain.dto.Categoria.CategoriaDto;
import br.ind.priceByCar.priceByCar.domain.entity.Categoria.CategoriaEntity;
import br.ind.priceByCar.priceByCar.repository.Categoria.CategoriaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.Optional;


@Service
public class CategoriaService {

    @Autowired
    private CategoriaRepository categoriaRepository;

    public Page<CategoriaEntity> listarCategoria(Pageable pageable) {
        return categoriaRepository.findAll(pageable);
    }

    public Integer inserirCategoria(CategoriaDto categoriaDto) {
        if (categoriaRepository.existsBydescricao(categoriaDto.getDescricao())) {
            throw new RuntimeException("Categoria: " + categoriaDto.getDescricao() + "já existe cadastrada!");
        } else {
            return categoriaRepository.save(CategoriaConverter.toEntity(categoriaDto)).getId();
        }
    }

    public void atualizarCategoriaPorId(CategoriaDto dto, Integer id) {
        categoriaRepository.findById(id).ifPresent(categoriaEntity -> {
            categoriaEntity.setDescricao(dto.getDescricao());
            categoriaRepository.save(categoriaEntity);
        });
    }

    public void deletarCategoria(Integer id) {
        categoriaRepository.findById(id).ifPresent(categoriaEntity -> categoriaRepository.deleteById(id));
    }

    public CategoriaEntity listarCategoriaPorId(Integer id) {
        Optional<CategoriaEntity> categoriaEntityOptional = categoriaRepository.findById(id);

        if (categoriaEntityOptional.isEmpty()) {
            throw new RuntimeException("Categoria não encontrada");
        } else
            return categoriaEntityOptional.get();
    }
}




