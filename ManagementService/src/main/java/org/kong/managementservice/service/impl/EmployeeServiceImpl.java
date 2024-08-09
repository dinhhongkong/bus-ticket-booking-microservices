package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.EmployeeDto;
import org.kong.managementservice.dto.UserDto;
import org.kong.managementservice.dto.request.UserDtoUpdate;
import org.kong.managementservice.entity.Employee;
import org.kong.managementservice.entity.User;
import org.kong.managementservice.exception.ResourceNotFoundException;
import org.kong.managementservice.mapper.EmployeeMapper;
import org.kong.managementservice.mapper.UserUpdateMapper;
import org.kong.managementservice.repository.EmployeeRepository;
import org.kong.managementservice.repository.UserRepository;
import org.kong.managementservice.service.EmployeeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
@Transactional
public class EmployeeServiceImpl implements EmployeeService {
    private EmployeeRepository employeeRepository;
    private EmployeeMapper employeeMapper;

    @Override
    public List<EmployeeDto> getAllEmployee() {
        List<Employee> employees =  employeeRepository.findAll();
        List<EmployeeDto> employeeDtos = new ArrayList<>();
        for (Employee employee: employees) {
            UserDto user = null;
            Integer id = null;
            String fullName = null;
            String cccd = null;
            String phoneNumber = null;
            String email = null;
            String gender = null;
            String address = null;

            if ( employee.getUser()!= null) {
                if (employee.getUser().getRole() != null) {
                    User userEntity = employee.getUser();
                    user = new UserDto(
                            userEntity.getId(),
                            userEntity.getRole().getId(),
                            userEntity.getRole().getRoleName(),
                            userEntity.getEnable()
                    );
                }

            }


            id = employee.getId();
            fullName = employee.getFullName();
            cccd = employee.getCccd();
            phoneNumber = employee.getPhoneNumber();
            email = employee.getEmail();
            gender = employee.getGender();
            address = employee.getAddress();
            EmployeeDto employeeDto = new EmployeeDto( id, fullName, cccd, phoneNumber, email, gender, address, user );
            employeeDtos.add(employeeDto);
        }
        return employeeDtos;
    }

    @Override
    public EmployeeDto addNewEmployee(EmployeeDto employeeDto) {
        Employee employee = employeeMapper.toEntity(employeeDto);
        employee = employeeRepository.save(employee);
        return employeeMapper.toDto(employee);
    }

    @Override
    public EmployeeDto updateEmployee(int id, EmployeeDto employeeDto) {
        Optional<Employee> employee = employeeRepository.findById(id);
        if (employee.isPresent()) {
            Employee existingEmployee = employee.get();
            Employee newEmployee = employeeMapper.partialUpdate(employeeDto,existingEmployee);
            newEmployee = employeeRepository.save(newEmployee);
            return employeeMapper.toDto(newEmployee);
        }

        throw new ResourceNotFoundException("employee not found with id " + id);
    }

    @Override
    public void deleteEmployeeById(int id) {
        employeeRepository.deleteById(id);
    }

}
