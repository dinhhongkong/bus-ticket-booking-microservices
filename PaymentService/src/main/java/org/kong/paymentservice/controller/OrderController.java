package org.kong.paymentservice.controller;


import lombok.RequiredArgsConstructor;
import org.kong.paymentservice.dto.request.PaymentTripRequest;
import org.kong.paymentservice.service.InvoiceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class OrderController {
//    private final InvoiceService invoiceService;
//
//    @PostMapping("/create-order")
//    public ResponseEntity<?> createOrder(@RequestBody PaymentTripRequest body){
//        return ResponseEntity.ok( invoiceService.reservation(body));
//    }
}
