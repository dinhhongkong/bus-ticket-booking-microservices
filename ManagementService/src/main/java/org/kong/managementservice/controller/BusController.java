package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.service.BusService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class BusController {
    private BusService busService;

    @GetMapping("/buses")
    public ResponseEntity<?> getAllBus() {
        return ResponseEntity.ok(busService.getAllBus());
    }

    @PostMapping("/bus")
    public ResponseEntity<?> addBus(@RequestBody BusDto busDto) {
        System.out.println(busDto.getLicensePlates());
        return ResponseEntity.ok(busService.addNewBus(busDto));
    }

    @PutMapping("/bus/{id}")
    public ResponseEntity<?> updateBus(@PathVariable int id, @RequestBody BusDto busDto) {
        return ResponseEntity.ok(busService.updateBus(id,busDto));
    }
    @DeleteMapping("/bus/{id}")
    public ResponseEntity<?> deleteBus(@PathVariable int id) {
        busService.deleteBusById(id);
        return ResponseEntity.accepted().build();
    }

}
