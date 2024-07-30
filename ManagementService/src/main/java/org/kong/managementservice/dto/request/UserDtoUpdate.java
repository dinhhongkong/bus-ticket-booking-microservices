package org.kong.managementservice.dto.request;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.managementservice.entity.User}
 */
@Value
public class UserDtoUpdate implements Serializable {
    Integer id;
    @NotNull
    @Size(max = 30)
    String username;
    @NotNull
    @Size(max = 100)
    String password;
    Integer roleId;
    String roleRoleName;
    @NotNull
    Boolean enable;
}