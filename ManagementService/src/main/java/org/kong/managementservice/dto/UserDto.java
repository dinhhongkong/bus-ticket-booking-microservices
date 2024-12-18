package org.kong.managementservice.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.managementservice.entity.User}
 */
@Value
public class UserDto implements Serializable {
    Integer id;
    Integer roleId;
    String roleName;
    Boolean enable;
}