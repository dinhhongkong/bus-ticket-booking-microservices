package org.kong.authservice.exception;


import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.UnsupportedJwtException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import java.util.Date;

@RestControllerAdvice
public class ValidationTokenHandler {
    @ExceptionHandler(MalformedJwtException.class)
    public ResponseEntity<?> tokenIsInvalid(Exception exception, WebRequest request) {
        return new ResponseEntity<>(new ErrorDetails(new Date(), exception.getMessage(), request.getDescription(false)), HttpStatus.UNAUTHORIZED);
    }

    @ExceptionHandler(ExpiredJwtException.class)
    public ResponseEntity<?> expiredToken(Exception exception, WebRequest request) {
        return new ResponseEntity<>(new ErrorDetails(new Date(), exception.getMessage(), request.getDescription(false)), HttpStatus.UNAUTHORIZED);
    }
    @ExceptionHandler(UnsupportedJwtException.class)
    public ResponseEntity<?> unsupportedToken(Exception exception, WebRequest request) {
        return new ResponseEntity<>(new ErrorDetails(new Date(), exception.getMessage(), request.getDescription(false)), HttpStatus.UNAUTHORIZED);
    }
    @ExceptionHandler(IllegalArgumentException.class)
    public ResponseEntity<?> claimsStringIsEmpty(Exception exception, WebRequest request) {
        return new ResponseEntity<>(new ErrorDetails(new Date(), exception.getMessage(), request.getDescription(false)), HttpStatus.UNAUTHORIZED);
    }
}
