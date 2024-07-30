package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.ProvinceDto;
import org.kong.managementservice.entity.Province;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface ProvinceMapper {
    Province toEntity(ProvinceDto provinceDto);

    ProvinceDto toDto(Province province);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Province partialUpdate(ProvinceDto provinceDto, @MappingTarget Province province);
}