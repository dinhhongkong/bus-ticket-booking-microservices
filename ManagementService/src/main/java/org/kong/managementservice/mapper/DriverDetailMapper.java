package org.kong.managementservice.mapper;

import org.kong.managementservice.entity.DriverDetail;
import org.kong.managementservice.dto.DriverDetailDto;
import org.mapstruct.*;

import java.util.Set;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface DriverDetailMapper {
    @Mapping(source = "driverFullName", target = "driver.fullName")
    @Mapping(source = "driverId", target = "driver.id")
    DriverDetail toEntity(DriverDetailDto driverDetailDto);

    @InheritInverseConfiguration(name = "toEntity")
    DriverDetailDto toDto(DriverDetail driverDetail);

    Set<DriverDetailDto> toDto(Set<DriverDetail> driverDetail);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    DriverDetail partialUpdate(DriverDetailDto driverDetailDto, @MappingTarget DriverDetail driverDetail);
}