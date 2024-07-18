package org.kong.bookingservice.mapper;

import org.kong.bookingservice.dto.ProvinceDto;
import org.kong.bookingservice.entity.Province;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface ProvinceMapper {
    Province toEntity(ProvinceDto provinceDto);

    ProvinceDto toDto(Province province);

    List<ProvinceDto> toDto(List<Province> provinces);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Province partialUpdate(ProvinceDto provinceDto, @MappingTarget Province province);
}