package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.DriverDto;
import org.kong.managementservice.entity.Driver;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface DriverMapper {
    Driver toEntity(DriverDto driverDto);

    DriverDto toDto(Driver driver);

    List<DriverDto> toDto(List<Driver> driver);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Driver partialUpdate(DriverDto driverDto, @MappingTarget Driver driver);
}