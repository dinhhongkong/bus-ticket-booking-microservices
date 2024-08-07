package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.service.BusService;
import org.kong.managementservice.service.JourneyService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class JourneyController {
    private JourneyService journeyService;

    @GetMapping("/journeys")
    public ResponseEntity<?> getAllJourney() {
        return ResponseEntity.ok(journeyService.getAllJourney());
    }

    @PostMapping("/journey")
    public ResponseEntity<?> addBus(@RequestBody BusDto busDto) {
        System.out.println(busDto.getLicensePlates());
        return ResponseEntity.ok("");
    }

    @PutMapping("/journey/{id}")
    public ResponseEntity<?> updateBus(@PathVariable int id, @RequestBody BusDto busDto) {
        return ResponseEntity.ok("");
    }
    @DeleteMapping("/journey/{id}")
    public ResponseEntity<?> deleteBus(@PathVariable int id) {

        return ResponseEntity.ok("");
    }
}
