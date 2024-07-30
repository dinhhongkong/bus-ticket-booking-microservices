package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.service.BusService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class BusController {
    private BusService busService;

    @GetMapping("buses")
    public ResponseEntity<?> getAllBus() {
        return ResponseEntity.ok(busService.getAllBus());
    }
}
