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
    @NotNull
    @Size(max = 30)
    String username;
    Integer roleId;
    String roleName;
    @NotNull
    Boolean enable;
}