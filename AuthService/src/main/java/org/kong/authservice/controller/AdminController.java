package org.kong.authservice.controller;

import lombok.RequiredArgsConstructor;
import org.kong.authservice.dto.request.SignUpRequest;
import org.kong.authservice.dto.request.UserLoginRequest;
import org.kong.authservice.dto.response.TokenResponse;
import org.kong.authservice.service.EmployeeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
public class AdminController {
    private final EmployeeService employeeService;
    @PostMapping("/admin/login")
    public ResponseEntity<?> login(@RequestBody UserLoginRequest userLoginRequest){
        TokenResponse tokenResponse = employeeService.performLogin(userLoginRequest);
        return new ResponseEntity<>(tokenResponse, HttpStatus.OK);
    }



    @GetMapping("/admin/validate-token/{token}")
    public ResponseEntity<?> validate(@PathVariable String token) {
        employeeService.validateToken(token);
        return new ResponseEntity<>("OK",HttpStatus.OK);
    }
}
