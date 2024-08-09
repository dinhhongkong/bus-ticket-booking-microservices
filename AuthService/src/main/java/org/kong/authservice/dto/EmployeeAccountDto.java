package org.kong.authservice.dto;

import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.authservice.entity.Employee}
 */
@Value
public class EmployeeAccountDto implements Serializable {
    int employeeId;
    String username;
    String password;
    int roleId;
    boolean enable;
}