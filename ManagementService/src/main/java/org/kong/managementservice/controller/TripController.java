package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.dto.request.TripCreateDto;
import org.kong.managementservice.service.TripService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;

@RestController
@RequestMapping("/manage/journey")
@AllArgsConstructor
public class TripController {

    private TripService tripService;

    @GetMapping("/trips/{id}")
    public ResponseEntity<?> getAllJourney(@PathVariable int id) {
        return ResponseEntity.ok(tripService.getAllTripByJourneyId(id));
    }

    @GetMapping("/trip/driver/{localDate}")
    public ResponseEntity<?> getDriverAvailable(@PathVariable LocalDate localDate) {
        return ResponseEntity.ok(tripService.getAllDriverAvailable(localDate));
    }

    @GetMapping("/trip/bus/{localDate}")
    public ResponseEntity<?> getBusAvailable(@PathVariable LocalDate localDate) {
        return ResponseEntity.ok(tripService.getBusNotRunning(localDate));
    }

    @PostMapping("/trip")
    public ResponseEntity<?> addBus(@RequestBody TripCreateDto tripDto) {
        tripService.addNewTrip(tripDto);
        return ResponseEntity.ok("");
    }

    @PutMapping("/trip/{id}")
    public ResponseEntity<?> updateBus(@PathVariable int id, @RequestBody TripCreateDto tripDto) {
        tripService.updateTrip(tripDto);
        return ResponseEntity.ok("");
    }
    @DeleteMapping("/trip/{id}")
    public ResponseEntity<?> deleteBus(@PathVariable int id) {
        tripService.deleteTrip(id);
        return ResponseEntity.ok("");
    }
}
