package org.kong.authservice.service.impl;

import io.jsonwebtoken.JwtException;
import lombok.AllArgsConstructor;
import org.kong.authservice.dto.request.UserLoginRequest;
import org.kong.authservice.dto.response.TokenResponse;
import org.kong.authservice.entity.User;
import org.kong.authservice.repository.UserRepository;
import org.kong.authservice.security.JwtTokenProvider;
import org.kong.authservice.service.EmployeeService;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;


@Service
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
    private JwtTokenProvider jwtTokenProvider;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Override
    public void validateToken(String token) {
        if (jwtTokenProvider.validateToken(token)) {
            return;
        }
        throw new JwtException("Token is valid");
    }

    @Override
    public TokenResponse performLogin(UserLoginRequest userLoginRequest) {
        Optional<User> user = userRepository.findByUsername(userLoginRequest.getUsername());
        if (user.isEmpty()) {
            throw new UsernameNotFoundException("Username not found");
        }
        if (!passwordEncoder.matches(userLoginRequest.getPassword(), user.get().getPassword())) {
            throw new BadCredentialsException("Incorrect password");
        }
        Map<String, Object> claims = new HashMap<>();
        claims.put("employeeId", user.get().getEmployeesByUserId().getEmployeeId());
        claims.put("name", user.get().getEmployeesByUserId().getFullName());
        claims.put("role", user.get().getRoleByRoleId().getRoleName());
        String accessToken = jwtTokenProvider.createToken(claims);
        return TokenResponse.builder()
                .accessToken(accessToken)
                .build();
    }
}
