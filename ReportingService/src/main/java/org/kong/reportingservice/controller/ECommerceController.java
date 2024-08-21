package org.kong.reportingservice.controller;


import lombok.AllArgsConstructor;
import org.kong.reportingservice.service.ECommerceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;

@RestController
@AllArgsConstructor
@RequestMapping("/report")
public class ECommerceController {
    private ECommerceService eCommerceService;

    @GetMapping("/total")
    public ResponseEntity<?> getTotal() {
        return ResponseEntity.ok(eCommerceService.totalDataStatus());
    }

    @GetMapping("/revenue/{year}")
    public ResponseEntity<?> getRevenue(@PathVariable Integer year) {
        return ResponseEntity.ok(eCommerceService.monthlyRevenueInYear(year));
    }

    @GetMapping("/busType/{year}")
    public ResponseEntity<?> getRateType(@PathVariable Integer year) {
        return ResponseEntity.ok(eCommerceService.ticketRate(year));
    }
}
