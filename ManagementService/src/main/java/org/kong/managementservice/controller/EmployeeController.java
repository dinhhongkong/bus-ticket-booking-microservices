package org.kong.managementservice.controller;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.EmployeeDto;
import org.kong.managementservice.dto.OfficeDto;
import org.kong.managementservice.dto.request.UserDtoUpdate;
import org.kong.managementservice.service.EmployeeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/manage")
@AllArgsConstructor
public class EmployeeController {
    private EmployeeService employeeService;

    @GetMapping("/employees")
    public ResponseEntity<?> getAll() {
        return ResponseEntity.ok(employeeService.getAllEmployee());
    }

    @PostMapping("/employee")
    public ResponseEntity<?> add(@RequestBody EmployeeDto employeeDto) {
        return ResponseEntity.ok(employeeService.addNewEmployee(employeeDto));
    }

    @PutMapping("/employee/{id}")
    public ResponseEntity<?> update(@PathVariable int id, @RequestBody EmployeeDto employeeDto) {
        return ResponseEntity.ok(employeeService.updateEmployee(id,employeeDto));
    }
    @DeleteMapping("/employee/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
        employeeService.deleteEmployeeById(id);
        return ResponseEntity.accepted().build();
    }

    @PostMapping("/employee/account")
    public ResponseEntity<?> updateAccount(@RequestBody UserDtoUpdate userDtoUpdate) {
        System.out.println("in ra: " + userDtoUpdate.getId() + userDtoUpdate.getUsername());
        employeeService.createAccountEmployee(userDtoUpdate);
        return ResponseEntity.ok("Success");
    }

}
