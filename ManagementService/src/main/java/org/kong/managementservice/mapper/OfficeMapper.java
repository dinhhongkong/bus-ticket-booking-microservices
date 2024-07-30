package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.OfficeDto;
import org.kong.managementservice.entity.Office;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface OfficeMapper {
    @Mapping(source = "provinceName", target = "province.provinceName")
    @Mapping(source = "provinceId", target = "province.id")
    Office toEntity(OfficeDto officeDto);

    @InheritInverseConfiguration(name = "toEntity")
    OfficeDto toDto(Office office);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Office partialUpdate(OfficeDto officeDto, @MappingTarget Office office);
}