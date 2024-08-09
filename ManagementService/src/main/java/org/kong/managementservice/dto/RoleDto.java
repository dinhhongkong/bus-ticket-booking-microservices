package org.kong.managementservice.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.managementservice.entity.Role}
 */
@Value
public class RoleDto implements Serializable {
    Integer id;
    @NotNull
    @Size(max = 10)
    String roleName;
}