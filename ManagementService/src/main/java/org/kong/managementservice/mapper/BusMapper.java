package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.entity.Bus;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface BusMapper {
    @Mapping(source = "typeName", target = "type.typeName")
    @Mapping(source = "typeId", target = "type.id")
    Bus toEntity(BusDto busDto);

    @InheritInverseConfiguration(name = "toEntity")
    BusDto toDto(Bus bus);

    List<BusDto> toDto(List<Bus> bus);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Bus partialUpdate(BusDto busDto, @MappingTarget Bus bus);
}