package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.JourneyDto;
import org.kong.managementservice.entity.Journey;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface JourneyMapper {
    Journey toEntity(JourneyDto journeyDto);

    JourneyDto toDto(Journey journey);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Journey partialUpdate(JourneyDto journeyDto, @MappingTarget Journey journey);
}