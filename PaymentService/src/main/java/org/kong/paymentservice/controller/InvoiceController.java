package org.kong.paymentservice.controller;


import lombok.RequiredArgsConstructor;
import org.kong.paymentservice.dto.request.PaymentTripRequest;
import org.kong.paymentservice.service.BookingService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class InvoiceController {
    private final BookingService bookingService;


    @GetMapping("/invoice")
    public ResponseEntity<?> bookingDetail(@RequestParam int invoiceId){
        return ResponseEntity.ok( bookingService.bookingDetail(invoiceId));
    }

    @PostMapping("/invoice")
    public ResponseEntity<?> createOrder(@RequestBody PaymentTripRequest body){
        return ResponseEntity.ok( bookingService.reservation(body));
    }
}
