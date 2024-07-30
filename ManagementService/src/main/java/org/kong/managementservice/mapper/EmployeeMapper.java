package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.EmployeeDto;
import org.kong.managementservice.entity.Employee;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface EmployeeMapper {
    @Mapping(source = "user.roleName", target = "user.role.roleName")
    @Mapping(source = "user.roleId", target = "user.role.id")
    Employee toEntity(EmployeeDto employeeDto);

    @InheritInverseConfiguration(name = "toEntity")
    EmployeeDto toDto(Employee employee);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Employee partialUpdate(EmployeeDto employeeDto, @MappingTarget Employee employee);
}