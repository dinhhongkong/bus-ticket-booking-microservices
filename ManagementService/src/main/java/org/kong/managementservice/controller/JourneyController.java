package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.dto.JourneyDto;
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

    @GetMapping("/journey/{id}")
    public ResponseEntity<?> getJourneybyId(@PathVariable int id) {
        return ResponseEntity.ok(journeyService.getJourneyById(id));
    }

    @PostMapping("/journey")
    public ResponseEntity<?> addBus(@RequestBody JourneyDto journeyDto) {
        System.out.println(journeyDto);
        journeyService.addNewJourney(journeyDto);
        return ResponseEntity.ok("");
    }

    @PutMapping("/journey/{id}")
    public ResponseEntity<?> updateBus(@PathVariable int id, @RequestBody BusDto busDto) {
        return ResponseEntity.ok("");
    }
    @DeleteMapping("/journey/{id}")
    public ResponseEntity<?> deleteBus(@PathVariable int id) {
        journeyService.deleteJourneyById(id);
        return ResponseEntity.ok("");
    }
}
