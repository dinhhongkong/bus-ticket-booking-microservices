package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.service.TicketService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class TicketController {
    private TicketService ticketService;
    @GetMapping("/tickets/{id}")
    public ResponseEntity<?> getAllByTripId(@PathVariable int id) {
        return ResponseEntity.ok(ticketService.getAllTicketInTrip(id));
    }

    @DeleteMapping("/ticket/{id}")
    public ResponseEntity<?> deleteTicket(@PathVariable int id) {
        ticketService.deleteTicket(id);
        return ResponseEntity.ok("oke");
    }
}
