package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.service.ManageTicketService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class ManageTicketController {
    private final ManageTicketService manageTicketService;

    @GetMapping("/check-ticket")
    public ResponseEntity<?> checkTicket(@RequestParam int ticketId, @RequestParam String phoneNumber) {
        return ResponseEntity.ok(manageTicketService.checkTicket(ticketId, phoneNumber));
    }

    @GetMapping("/check-ticket/cancel")
    public ResponseEntity<?> cancelTicket(@RequestParam int ticketId) {
        manageTicketService.cancelTicket(ticketId);
        return ResponseEntity.ok("ok");
    }

    @GetMapping("/check-ticket/pay")
    public ResponseEntity<?> paymentTicket(@RequestParam int ticketId) {
        manageTicketService.paymentTicket(ticketId);
        return ResponseEntity.ok("oke");
    }



}
