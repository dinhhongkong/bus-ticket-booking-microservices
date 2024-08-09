package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.dto.JourneyDto;
import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.service.JourneyService;
import org.kong.managementservice.service.TripService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage/journey")
@AllArgsConstructor
public class TripController {

    private TripService tripService;

    @GetMapping("/trips/{id}")
    public ResponseEntity<?> getAllJourney(@PathVariable int id) {
        return ResponseEntity.ok(tripService.getAllTripByJourneyId(id));
    }

    @PostMapping("/trip")
    public ResponseEntity<?> addBus(@RequestBody TripDto tripDto) {
        tripService.addNewTrip(tripDto);
        return ResponseEntity.ok("");
    }

    @PutMapping("/trip/{id}")
    public ResponseEntity<?> updateBus(@PathVariable int id, @RequestBody TripDto tripDto) {
        return ResponseEntity.ok("");
    }
    @DeleteMapping("/trip/{id}")
    public ResponseEntity<?> deleteBus(@PathVariable int id) {
        tripService.deleteTrip(id);
        return ResponseEntity.ok("");
    }
}
