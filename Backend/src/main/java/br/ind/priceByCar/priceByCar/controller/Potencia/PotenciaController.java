package br.ind.priceByCar.priceByCar.controller.Potencia;

import br.ind.priceByCar.priceByCar.domain.dto.Potencia.PotenciaDto;
import br.ind.priceByCar.priceByCar.domain.entity.Potencia.PotenciaEntity;
import br.ind.priceByCar.priceByCar.service.Potencia.PotenciaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;


@RestController
@RequestMapping("/potencias")
public class PotenciaController {

    @Autowired
    private PotenciaService service;

    @GetMapping
    public ResponseEntity<Page<PotenciaEntity>> listarPotencias(Pageable pageable) {
        return ResponseEntity.ok(service.listarPotencias(pageable));
    }

    @GetMapping("/{id}")
    public ResponseEntity<PotenciaEntity> listarPotenciaPorId(@PathVariable Integer id) {
        return ResponseEntity.ok(service.listarPOtenciaPorId(id));
    }


    @DeleteMapping("/{id}")
    public ResponseEntity<HttpStatus> deletePotencia(@PathVariable Integer id) {
        return null;
    }


    @PutMapping("/{id}")
    public ResponseEntity<HttpStatus> atualizarPotencia(@RequestBody PotenciaDto dto, @PathVariable Integer id) {
        return null;
    }

    @PostMapping
    public ResponseEntity<Integer> inserirPotencia(@RequestBody PotenciaDto dto, UriComponentsBuilder uriComponentsBuilder) {
        Integer potenciaInserida = service.inserirPotencia(dto);
        URI uri =  uriComponentsBuilder.path("/potencias/{id}").buildAndExpand(potenciaInserida).toUri();
        return ResponseEntity.created(uri).body(potenciaInserida);
    }

}























































