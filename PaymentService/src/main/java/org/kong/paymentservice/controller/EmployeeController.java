package org.kong.paymentservice.controller;


import lombok.RequiredArgsConstructor;
import org.kong.paymentservice.dto.request.PaymentTripRequest;
import org.kong.paymentservice.service.impl.EmployeeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class EmployeeController {
    private final EmployeeService employeeService;

    @PostMapping("/manage/invoice")
    public ResponseEntity<?> createOrder(@RequestBody PaymentTripRequest body){
        return ResponseEntity.ok( employeeService.reservation(body));
    }



}
