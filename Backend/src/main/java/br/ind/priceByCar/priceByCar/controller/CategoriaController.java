package br.ind.priceByCar.priceByCar.controller;

import br.ind.priceByCar.priceByCar.domain.dto.CategoriaDto;
import br.ind.priceByCar.priceByCar.domain.entity.CategoriaEntity;
import br.ind.priceByCar.priceByCar.service.CategoriaService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;

@RestController
@RequestMapping("/categorias")
public class CategoriaController {

    @Autowired
    private CategoriaService categoriaService;

    @GetMapping
    ResponseEntity<?> listarCategoria(Pageable pageable) {
        return ResponseEntity.ok(categoriaService.listarCategoria(pageable));
    }

    @GetMapping("/{id}")
    public ResponseEntity<CategoriaEntity> listarCategoriaPorId(@PathVariable Integer id) {
        return ResponseEntity.ok(categoriaService.listarCategoriaPorId(id));
    }

    @PutMapping("/{id}")
    ResponseEntity<HttpStatus> atualizarCategoriaPorId(@RequestBody @Valid CategoriaDto categoriaDto, @PathVariable Integer id) {
        categoriaService.atualizarCategoriaPorId(categoriaDto, id);
        return ResponseEntity.ok().build();
    }

    @PostMapping
    ResponseEntity<Integer> inserirCategoria(@RequestBody @Valid CategoriaDto categoriaDto, UriComponentsBuilder uriComponentsBuilder) {
        Integer categoriaInserida = categoriaService.inserirCategoria(categoriaDto);
        URI uri = uriComponentsBuilder.path("/categoria/{id}").buildAndExpand(categoriaInserida).toUri();
        return ResponseEntity.created(uri).body(categoriaInserida);
    }

    @DeleteMapping("/{id}")
    ResponseEntity<HttpStatus> deleteCategoria(@PathVariable Integer id) {
        categoriaService.deletarCategoria(id);
        return ResponseEntity.noContent().build();
    }

}
