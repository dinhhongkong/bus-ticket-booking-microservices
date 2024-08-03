package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.OfficeDto;
import org.kong.managementservice.service.OfficeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class OfficeController {
    private OfficeService officeService;
    @GetMapping("/offices")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(officeService.getAllOffice());
    }

    @PostMapping("/office")
    public ResponseEntity<?> add(@RequestBody OfficeDto officeDto) {
        return ResponseEntity.ok(officeService.addNewOffice(officeDto));
    }

    @PutMapping("/office/{id}")
    public ResponseEntity<?> update(@PathVariable int id, @RequestBody OfficeDto officeDto) {
        return ResponseEntity.ok(officeService.updateOffice(id,officeDto));
    }
    @DeleteMapping("/office/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        officeService.deleteOfficeById(id);
        return ResponseEntity.accepted().build();
    }

}
