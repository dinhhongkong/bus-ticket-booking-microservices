package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.JourneyDetailDto;
import org.kong.managementservice.entity.JourneyDetail;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface JourneyDetailMapper {
    @Mapping(source = "province", target = "office.province.provinceName")
    @Mapping(source = "officeAddress", target = "office.address")
    @Mapping(source = "officeName", target = "office.officeName")
    @Mapping(source = "officeId", target = "office.id")
    JourneyDetail toEntity(JourneyDetailDto journeyDetailDto);

    @InheritInverseConfiguration(name = "toEntity")
    JourneyDetailDto toDto(JourneyDetail journeyDetail);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    JourneyDetail partialUpdate(JourneyDetailDto journeyDetailDto, @MappingTarget JourneyDetail journeyDetail);
}