package org.kong.managementservice.service;

import org.kong.managementservice.dto.EmployeeDto;
import org.kong.managementservice.dto.request.UserDtoUpdate;

public interface EmployeeService {
    EmployeeDto addNewEmployee(EmployeeDto employee);

    EmployeeDto updateEmployee(EmployeeDto employee);

    void deleteEmployeeById(int id);

    void createAccountEmployee(UserDtoUpdate user);

    void setActiveAccount(UserDtoUpdate user);

}
