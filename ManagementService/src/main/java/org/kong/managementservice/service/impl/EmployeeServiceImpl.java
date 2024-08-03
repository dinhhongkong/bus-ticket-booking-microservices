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
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeRepository employeeRepository;
    private UserRepository userRepository;
    private EmployeeMapper employeeMapper;
    private UserUpdateMapper userUpdateMapper;

    @Override
    public List<EmployeeDto> getAllEmployee() {
        List<Employee> employees =  employeeRepository.findAll();
        return employeeMapper.toDto(employees);
    }

    @Override
    public EmployeeDto addNewEmployee(EmployeeDto employeeDto) {
        User user = userRepository.save(new User());
        Employee employee = employeeMapper.toEntity(employeeDto);
        employee.setUser(user);
        employee = employeeRepository.save(employee);
        return employeeMapper.toDto(employee);
    }

    @Override
    public EmployeeDto updateEmployee(int id, EmployeeDto employeeDto) {
        Optional<Employee> employee = employeeRepository.findById(id);
        if (employee.isPresent()) {
            Employee existingEmployee = employee.get();
            Employee newEmployee = employeeMapper.partialUpdate(employeeDto,existingEmployee);
            employeeRepository.save(newEmployee);
        }

        throw new ResourceNotFoundException("employee not found with id " + id);
    }

    @Override
    public void deleteEmployeeById(int id) {
        employeeRepository.deleteById(id);
    }

    @Override
    public void createAccountEmployee(UserDtoUpdate userDto) {
        Optional<User> user = userRepository.findById(userDto.getId());
        if (user.isPresent()) {
            User existingUser = user.get();
            User newUser = userUpdateMapper.partialUpdate(userDto,existingUser);
            newUser.setEnable(true);
            userRepository.save(newUser);
        }
        else {
            throw new ResourceNotFoundException("User not found");
        }


    }

    @Override
    public void setActiveAccount(UserDtoUpdate user) {

    }
}
