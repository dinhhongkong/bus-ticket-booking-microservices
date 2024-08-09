package org.kong.authservice.service.impl;

import io.jsonwebtoken.JwtException;
import lombok.AllArgsConstructor;
import org.kong.authservice.dto.EmployeeAccountDto;
import org.kong.authservice.dto.request.UserLoginRequest;
import org.kong.authservice.dto.response.TokenResponse;
import org.kong.authservice.entity.Employee;
import org.kong.authservice.entity.User;
import org.kong.authservice.repository.EmployeeRepository;
import org.kong.authservice.repository.UserRepository;
import org.kong.authservice.security.JwtTokenProvider;
import org.kong.authservice.service.EmployeeService;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;


@Service
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
    private JwtTokenProvider jwtTokenProvider;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;
    private EmployeeRepository employeeRepository;

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
        if (user.get().getRoleByRoleId().getRoleName().equals("CUSTOMER")) {
            throw new BadCredentialsException("Unauthorized");
        }
        Map<String, Object> claims = new HashMap<>();
        claims.put("username", user.get().getUsername());
        claims.put("employeeId", user.get().getEmployeesByUserId().getEmployeeId());
        claims.put("name", user.get().getEmployeesByUserId().getFullName());
        claims.put("role", user.get().getRoleByRoleId().getRoleName());
        String accessToken = jwtTokenProvider.createToken(claims);
        return TokenResponse.builder()
                .accessToken(accessToken)
                .build();
    }

    @Override
    @Transactional
    public void creatAccount(EmployeeAccountDto accountDto) {
        Employee employee = employeeRepository.findById(accountDto.getEmployeeId())
                .orElseThrow(()-> new RuntimeException("Not found"));

        User user = userRepository.findByEmployeeId(accountDto.getEmployeeId());
        if (user == null) {
            user = new User();
        }
        user.setUsername(accountDto.getUsername());
        user.setPassword(passwordEncoder.encode(accountDto.getPassword()));
        user.setRoleId(accountDto.getRoleId());
        user.setEnable(accountDto.isEnable());
        user = userRepository.save(user);


        if (employee.getUserId() == null) {
            employee.setUserId(user.getUserId());
            employeeRepository.save(employee);
        }
    }
}
