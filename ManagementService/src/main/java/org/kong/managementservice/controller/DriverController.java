package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.DriverDto;
import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.service.DriverService;
import org.kong.managementservice.service.TripService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class DriverController {
    private DriverService driverService;

    @GetMapping("/drivers")
    public ResponseEntity<?> getAllJourney() {
        return ResponseEntity.ok(driverService.getAllDriver());
    }

    @PostMapping("/driver")
    public ResponseEntity<?> addBus(@RequestBody DriverDto driverDto) {

        return ResponseEntity.ok( driverService.addNewDriver(driverDto));
    }

    @PutMapping("/driver/{id}")
    public ResponseEntity<?> updateBus(@PathVariable int id, @RequestBody DriverDto driverDto) {
        return ResponseEntity.ok(driverService.updateDriver(id,driverDto));
    }
    @DeleteMapping("/driver/{id}")
    public ResponseEntity<?> deleteBus(@PathVariable int id) {
        driverService.deleteDriverById(id);
        return ResponseEntity.ok("");
    }
}
