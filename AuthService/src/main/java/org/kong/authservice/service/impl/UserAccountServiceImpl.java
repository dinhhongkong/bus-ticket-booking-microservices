package org.kong.authservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.authservice.dto.request.ChangePassRequest;
import org.kong.authservice.dto.request.SignUpRequest;
import org.kong.authservice.dto.request.UserLoginRequest;
import org.kong.authservice.dto.response.TokenResponse;
import org.kong.authservice.entity.User;
import org.kong.authservice.exception.UsernameAlreadyExistsException;
import org.kong.authservice.repository.UserRepository;
import org.kong.authservice.security.JwtTokenProvider;
import org.kong.authservice.service.UserAccountService;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.password.CompromisedPasswordException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;


@Service
@AllArgsConstructor
public class UserAccountServiceImpl implements UserAccountService {

    private JwtTokenProvider jwtTokenProvider;
    private UserRepository userRepository;
    private PasswordEncoder passwordEncoder;

    @Override
    public void registerUser(SignUpRequest signUpRequest) {
        Optional<User> user = userRepository.findByUsername(signUpRequest.getUsername());
        if (user.isPresent()) {
            throw new UsernameAlreadyExistsException("Username already exists");
        }
        User newUser = User.builder()
                .username(signUpRequest.getUsername())
                .password(passwordEncoder.encode(signUpRequest.getPassword()))
                .roleId(1)
                .enable(true)
                .build();
        userRepository.save(newUser);
    }

    @Override
    public boolean authenticateLogin(String userName, String email, String password) {
        return false;
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
        claims.put("customerId", user.get().getUserId());
        claims.put("username", user.get().getUsername());
        String accessToken = jwtTokenProvider.createToken(claims);
        return TokenResponse.builder()
                .accessToken(accessToken)
                .build();
    }

    @Override
    public String validateAccount(String email, String otp, String newPass, String roleId) {
        return null;
    }

    @Override
    public boolean updatePasswordUsingOldPassword(ChangePassRequest changePassRequest) {
        return false;
    }

    @Override
    public boolean updatePasswordUsingOTP(ChangePassRequest changePassRequest) {
        return false;
    }

    @Override
    public boolean registerCustomer(SignUpRequest signUpRequest) {
        return false;
    }
}
