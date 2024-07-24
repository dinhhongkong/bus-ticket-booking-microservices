package org.kong.bookingservice.controller;

import lombok.RequiredArgsConstructor;
import org.kong.bookingservice.dto.response.TripDetailsDto;
import org.kong.bookingservice.service.TripService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/booking")
@RequiredArgsConstructor
@CrossOrigin
public class TripController {
    private final TripService tripService;

    @GetMapping("/search/trip")
    public ResponseEntity<?> searchTrip(
            @RequestParam int departureProvinceId,
            @RequestParam int destinationProvinceId,
            @RequestParam String startDate ) {

        return ResponseEntity.ok(
                tripService.getSearchTrip(departureProvinceId,destinationProvinceId, startDate));

    }

    @GetMapping("/trip/{id}")
    public ResponseEntity<?> getTipsDetails(@PathVariable int id) {
        TripDetailsDto response = tripService.getDetailsTrip(id);
        return new ResponseEntity<>(response, HttpStatus.OK);

    }




}
