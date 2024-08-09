package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.entity.Trip;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface TripMapper {
    @Mapping(source = "departureTime", target = "journey.departureTime")
    @Mapping(source = "priceId", target = "price.id")
    @Mapping(source = "bus", target = "bus")
    @Mapping(source = "price", target = "price.price")
    @Mapping(source = "bus.typeId", target = "bus.type.id")
    @Mapping(source = "bus.typeName", target = "bus.type.typeName")
    Trip toEntity(TripDto tripDto);

    @Mapping(source = "price.price", target = "price")
    TripDto toDto(Trip trip);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    @Mapping(source = "price", target = "price.price")
    Trip partialUpdate(TripDto tripDto, @MappingTarget Trip trip);
}