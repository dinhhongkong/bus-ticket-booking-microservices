package org.kong.managementservice.controller;

import lombok.RequiredArgsConstructor;

import org.kong.managementservice.service.LocationService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/manage")
@RequiredArgsConstructor
public class LocationController {
    private final LocationService locationService;

    @GetMapping("/provinces")
    public ResponseEntity<?> getAllProvinces() {
        return ResponseEntity.ok(locationService.getAllProvince());
    }

    @GetMapping("/province/{id}/offices")
    public ResponseEntity<?> getAllOfficeByProvince(@PathVariable int id) {
        return ResponseEntity.ok(locationService.getOfficeByProvinceId(id));
    }



}
