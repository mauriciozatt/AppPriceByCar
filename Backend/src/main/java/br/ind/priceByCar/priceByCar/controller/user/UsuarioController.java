package br.ind.priceByCar.priceByCar.controller.user;


import br.ind.priceByCar.priceByCar.domain.dto.user.UsuarioDto;
import br.ind.priceByCar.priceByCar.security.JWTService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(name = "v1/login")
public class UsuarioController {


    @Autowired
    private AuthenticationManager authenticationManager;


    @Autowired
    private JWTService jwtService;

    public ResponseEntity<String> autenticar(@RequestBody UsuarioDto dto) {
        try {
            UsernamePasswordAuthenticationToken usuarioParaSerAutenticado = new UsernamePasswordAuthenticationToken(dto.username(), dto.password());
            //quando chamo o authenticate do AuthenticationManager o spring vai no meu UsuarioService que implementou UserDetailsService
            // e chama o método que busca o usuário do banco com base no username do meu dto, depois utiliza do PasswordEncoder que defini
            // como um Bean .matches (método interno) para comparar se o hash da senha vinda do dto bate com o hash da senha do banco..
            authenticationManager.authenticate(usuarioParaSerAutenticado);
            String token = jwtService.generateToken(dto.username());
            return ResponseEntity.ok().body(token);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Usuário não autenticado!");
        }
    }


}
