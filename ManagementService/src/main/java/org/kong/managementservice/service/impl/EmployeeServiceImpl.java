package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.EmployeeDto;
import org.kong.managementservice.dto.request.UserDtoUpdate;
import org.kong.managementservice.entity.Employee;
import org.kong.managementservice.entity.User;
import org.kong.managementservice.mapper.EmployeeMapper;
import org.kong.managementservice.mapper.UserUpdateMapper;
import org.kong.managementservice.repository.EmployeeRepository;
import org.kong.managementservice.repository.UserRepository;
import org.kong.managementservice.service.EmployeeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@AllArgsConstructor
public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeRepository employeeRepository;
    private UserRepository userRepository;
    private EmployeeMapper employeeMapper;
    private UserUpdateMapper userUpdateMapper;

    @Override
    @Transactional
    public EmployeeDto addNewEmployee(EmployeeDto employeeDto) {
        User user = userRepository.save(new User());
        Employee employee = employeeMapper.toEntity(employeeDto);
        employee.setUser(user);
        employeeRepository.save(employee);
        return employeeDto;
    }

    @Override
    public EmployeeDto updateEmployee(EmployeeDto employeeDto) {
        Employee employee = employeeMapper.toEntity(employeeDto);
        employeeRepository.save(employee);
        return employeeDto;
    }

    @Override
    public void deleteEmployeeById(int id) {
        employeeRepository.deleteById(id);
    }

    @Override
    public void createAccountEmployee(UserDtoUpdate user) {

    }

    @Override
    public void setActiveAccount(UserDtoUpdate user) {

    }
}
