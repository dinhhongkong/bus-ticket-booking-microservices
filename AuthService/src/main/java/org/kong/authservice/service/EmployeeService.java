package org.kong.authservice.service;

import org.kong.authservice.dto.request.UserLoginRequest;
import org.kong.authservice.dto.response.TokenResponse;

public interface EmployeeService {
    void validateToken(String token);
    TokenResponse performLogin(UserLoginRequest userLoginRequest);
}
