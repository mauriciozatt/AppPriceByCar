package br.ind.priceByCar.priceByCar.controller;

import br.ind.priceByCar.priceByCar.domain.dto.GrupoDto;
import br.ind.priceByCar.priceByCar.service.GrupoService;
import jakarta.transaction.Transactional;
import jakarta.validation.Valid;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;


@RestController
@RequestMapping("/grupos")
public class GrupoController {

    private final GrupoService grupoService;

    public GrupoController(GrupoService grupoService) {
        this.grupoService = grupoService;
    }

    @PostMapping
    @Transactional
    public ResponseEntity<?> inserirGrupo(@RequestBody @Valid GrupoDto grupoDto, UriComponentsBuilder uriBuilder) {
        try {
            Integer idInserido = grupoService.inserirGrupo(grupoDto);
            var uri = uriBuilder.path("/grupos/{id}").buildAndExpand(idInserido).toUri();
            return ResponseEntity.created(uri).body(idInserido);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    @GetMapping
    public ResponseEntity<?> buscarGrupos(Pageable pageable) {
        try {
            return ResponseEntity.ok().body(grupoService.buscarGrupos(pageable));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }

    }

    @GetMapping("/{id}")
    public ResponseEntity<?> buscarGrupoPorId(@PathVariable Integer id) {
        try {
            return ResponseEntity.ok().body(grupoService.buscarGrupoPorId(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }


    public void atualizarGrupoPorId() {

    }

    @DeleteMapping("/{id}")
    public ResponseEntity deletarGrupoPorId(@PathVariable Integer id) {
        return grupoService.deletarGrupoPorId(id);
    }


}
