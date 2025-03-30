package br.ind.priceByCar.priceByCar.security;

import br.ind.priceByCar.priceByCar.service.user.UsuarioService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

@Component
public class SecurityFilter extends OncePerRequestFilter {


    @Autowired
    private UsuarioService usuarioService;


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String header = request.getHeader("Authorization");

        if ((header != null) && (header.startsWith("Bearer "))) {
            String token = header.substring(7);
            String username = JWTService.validadeAndExtractUsername(token);
            UserDetails userDetails = usuarioService.loadUserByUsername(username);
            UsernamePasswordAuthenticationToken usuarioAutenticado = new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(usuarioAutenticado);
        } else
            filterChain.doFilter(request, response);
    }

}
