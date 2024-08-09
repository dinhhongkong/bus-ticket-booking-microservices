package org.kong.managementservice.service;

import org.kong.managementservice.dto.EmployeeDto;
import org.kong.managementservice.dto.request.UserDtoUpdate;

import java.util.List;

public interface EmployeeService {

    List<EmployeeDto> getAllEmployee();
    EmployeeDto addNewEmployee(EmployeeDto employee);

    EmployeeDto updateEmployee(int id,EmployeeDto employee);

    void deleteEmployeeById(int id);


}
