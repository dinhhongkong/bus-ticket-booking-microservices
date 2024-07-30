package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.request.UserDtoUpdate;
import org.kong.managementservice.entity.User;
import org.mapstruct.*;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface UserUpdateMapper {
    @Mapping(source = "roleRoleName", target = "role.roleName")
    @Mapping(source = "roleId", target = "role.id")
    User toEntity(UserDtoUpdate userDtoUpdate);

    @InheritInverseConfiguration(name = "toEntity")
    UserDtoUpdate toDto(User user);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    User partialUpdate(UserDtoUpdate userDtoUpdate, @MappingTarget User user);
}