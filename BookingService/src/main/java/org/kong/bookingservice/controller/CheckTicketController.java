package org.kong.bookingservice.controller;

import lombok.RequiredArgsConstructor;
import org.kong.bookingservice.entity.TicketInformation;
import org.kong.bookingservice.service.CheckTicketService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/booking")
@RequiredArgsConstructor
public class CheckTicketController {
    private final CheckTicketService checkTicketService;

    @GetMapping("/check-ticket")
    public ResponseEntity<TicketInformation> checkTicket(@RequestParam int ticketId, @RequestParam String phoneNumber) {
        return ResponseEntity.ok(checkTicketService.checkTicket(ticketId, phoneNumber));
    }

}
