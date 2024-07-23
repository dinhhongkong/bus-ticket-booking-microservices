package org.kong.authservice.service;

import org.kong.authservice.dto.request.ChangePassRequest;
import org.kong.authservice.dto.request.SignUpRequest;
import org.kong.authservice.dto.request.UserLoginRequest;
import org.kong.authservice.dto.response.TokenResponse;

public interface UserAccountService  {
    void registerUser(SignUpRequest signUpRequest);
    boolean authenticateLogin(String userName, String email, String password);
    TokenResponse performLogin(UserLoginRequest userLoginRequest);
    String validateAccount(String email, String otp, String newPass, String roleId);
    boolean updatePasswordUsingOldPassword(ChangePassRequest changePassRequest);
    boolean updatePasswordUsingOTP(ChangePassRequest changePassRequest);
    boolean registerCustomer(SignUpRequest signUpRequest);
    void validateToken(String token);
}