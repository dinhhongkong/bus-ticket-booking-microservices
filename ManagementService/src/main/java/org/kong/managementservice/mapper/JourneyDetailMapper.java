package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.JourneyDetailDto;
import org.kong.managementservice.entity.JourneyDetail;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface JourneyDetailMapper {
    JourneyDetail toEntity(JourneyDetailDto journeyDetailDto);

    JourneyDetailDto toDto(JourneyDetail journeyDetail);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    JourneyDetail partialUpdate(JourneyDetailDto journeyDetailDto, @MappingTarget JourneyDetail journeyDetail);
}