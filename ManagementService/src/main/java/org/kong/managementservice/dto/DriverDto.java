package org.kong.managementservice.dto;

import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.managementservice.entity.Driver}
 */
@Value
public class DriverDto implements Serializable {
    Integer id;
    @Size(max = 50)
    String fullName;
    @Size(max = 20)
    String cccd;
    @Size(max = 20)
    String license;
    @Size(max = 13)
    String phoneNumber;
    @Size(max = 50)
    String email;
    @Size(max = 15)
    String gender;
    @Size(max = 200)
    String address;
}