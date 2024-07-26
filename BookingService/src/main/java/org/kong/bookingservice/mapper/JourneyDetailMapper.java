package org.kong.bookingservice.mapper;

import org.kong.bookingservice.dto.JourneyDetailDto;
import org.kong.bookingservice.entity.JourneyDetail;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface JourneyDetailMapper {
    @Mapping(source = "address", target = "office.address")
    @Mapping(source = "officeName", target = "office.officeName")
    @Mapping(source = "officeId", target = "office.id")
    JourneyDetail toEntity(JourneyDetailDto journeyDetailDto);

    @InheritInverseConfiguration(name = "toEntity")
    JourneyDetailDto toDto(JourneyDetail journeyDetail);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    JourneyDetail partialUpdate(JourneyDetailDto journeyDetailDto, @MappingTarget JourneyDetail journeyDetail);
}