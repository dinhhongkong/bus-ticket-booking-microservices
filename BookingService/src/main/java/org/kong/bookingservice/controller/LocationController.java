package org.kong.bookingservice.controller;

import lombok.RequiredArgsConstructor;
import org.kong.bookingservice.service.LocationService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/booking")
@RequiredArgsConstructor
@CrossOrigin
public class LocationController {
    private final LocationService locationService;

    @GetMapping("/provinces")
    public ResponseEntity<?> getAllProvinces() {
        return ResponseEntity.ok(locationService.getAllProvince());
    }


}
