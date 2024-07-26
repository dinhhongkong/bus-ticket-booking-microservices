package org.kong.authservice.controller;

import lombok.RequiredArgsConstructor;
import org.kong.authservice.dto.request.SignUpRequest;
import org.kong.authservice.dto.request.UserLoginRequest;
import org.kong.authservice.dto.response.TokenResponse;
import org.kong.authservice.service.UserAccountService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/auth")
@CrossOrigin
public class CustomerController {

    private final UserAccountService userAccountService;
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody UserLoginRequest userLoginRequest){
        TokenResponse tokenResponse = userAccountService.performLogin(userLoginRequest);
        return new ResponseEntity<>(tokenResponse, HttpStatus.OK);
    }


    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody SignUpRequest signUpRequest) {
        userAccountService.registerUser(signUpRequest);
        return new ResponseEntity<>(HttpStatus.CREATED);
    }

    @GetMapping("/validate-token/{token}")
    public ResponseEntity<?> validate(@PathVariable String token) {
        userAccountService.validateToken(token);
        return new ResponseEntity<>("OK",HttpStatus.OK);
    }


//
//    public ResponseEntity<?> changePassword {
//
//    }
//
//    public ResponseEntity<?> forgetPassword() {
//
//    }

}
