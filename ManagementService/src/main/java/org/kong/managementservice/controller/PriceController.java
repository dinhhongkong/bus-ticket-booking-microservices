package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.PriceDto;
import org.kong.managementservice.service.PriceService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class PriceController {
    private PriceService priceService;
    @GetMapping("/price")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(priceService.getAllPrice());
    }

    @PostMapping("/price")
    public ResponseEntity<?> add(@RequestBody PriceDto priceDto) {
        return ResponseEntity.ok(priceService.createPrice(priceDto));
    }


    @DeleteMapping("/price/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        priceService.deletePrice(id);
        return ResponseEntity.accepted().build();
    }

}
