package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.PriceDto;
import org.kong.managementservice.entity.Price;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface PriceMapper {
    Price toEntity(PriceDto priceDto);

    PriceDto toDto(Price price);

    List<PriceDto> toDto(List<Price> price);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Price partialUpdate(PriceDto priceDto, @MappingTarget Price price);
}