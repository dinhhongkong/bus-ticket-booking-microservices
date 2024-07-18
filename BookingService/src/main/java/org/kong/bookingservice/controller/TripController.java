package org.kong.bookingservice.controller;

import lombok.RequiredArgsConstructor;
import org.kong.bookingservice.service.TripService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/booking")
@RequiredArgsConstructor
public class TripController {
    private final TripService tripService;

    @RequestMapping("/search/trip")
    public ResponseEntity<?> searchTrip(
            @RequestParam int departureProvinceId,
            @RequestParam int destinationProvinceId,
            @RequestParam String date ) {

        return ResponseEntity.ok(
                tripService.getSearchTrip(departureProvinceId,destinationProvinceId, date));

    }


}
