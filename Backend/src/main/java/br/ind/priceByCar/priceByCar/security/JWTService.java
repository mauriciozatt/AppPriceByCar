package br.ind.priceByCar.priceByCar.security;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class JWTService {

   static String SECRET_KEY = "UNS_CROCODILO_BEM_LOKO";

    public String generateToken(String username) {
        return JWT.create()
                .withSubject(username)
                .withIssuedAt(new Date())
                .withExpiresAt(new Date().toInstant().plusSeconds(600))
                .sign(Algorithm.HMAC256(SECRET_KEY));
    }


    public static String validadeAndExtractUsername(String token) {
        try {
            JWTVerifier objetoDeVerificacao = JWT.require(Algorithm.HMAC256(SECRET_KEY)).build();
            DecodedJWT decodedJWT = objetoDeVerificacao.verify(token);
            return decodedJWT.getSubject();
        } catch (JWTVerificationException e) {
            throw new RuntimeException("Token inválido ou expirado!");
        }
    }

}
