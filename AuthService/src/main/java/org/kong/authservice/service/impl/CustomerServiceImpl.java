package org.kong.authservice.service.impl;

import org.kong.authservice.entity.User;
import org.kong.authservice.repository.UserRepository;
import org.kong.authservice.security.JwtTokenProvider;
import org.kong.authservice.service.CustomerService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;


@Service
public class CustomerServiceImpl implements CustomerService {
    private JwtTokenProvider jwtTokenProvider;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    public String generateToken(String username) {
        Optional<User> user = userRepository.findByUsername(username);
        Map<String, Object> claims = new HashMap<>();
        claims.put("customerId", user.get().getUserId());
        return jwtTokenProvider.createToken(claims);
    }
}
