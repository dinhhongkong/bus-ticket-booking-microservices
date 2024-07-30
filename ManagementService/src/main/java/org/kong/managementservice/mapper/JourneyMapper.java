package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.JourneyDto;
import org.kong.managementservice.entity.Journey;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING, uses = {JourneyDetailMapper.class})
public interface JourneyMapper {
    Journey toEntity(JourneyDto journeyDto);

    @AfterMapping
    default void linkJourneyDetails(@MappingTarget Journey journey) {
        journey.getJourneyDetails().forEach(journeyDetail -> journeyDetail.setJourney(journey));
    }

    JourneyDto toDto(Journey journey);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Journey partialUpdate(JourneyDto journeyDto, @MappingTarget Journey journey);
}