package br.ind.priceByCar.priceByCar.exception;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


/* captura as exceções lançadas em qualquer camada da aplicação, desde que elas se propagam até os controladores....*/
@ControllerAdvice
public class InterceptadorDeException {

    @ExceptionHandler(value = {Exception.class})
    public ResponseEntity<String> interceptor(Exception e) {
        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Erro: " + e.getMessage() + "/n" + "Exception: " + e.getCause().toString());
    }
}
