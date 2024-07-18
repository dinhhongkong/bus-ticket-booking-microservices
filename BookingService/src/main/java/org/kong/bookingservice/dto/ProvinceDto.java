package org.kong.bookingservice.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.bookingservice.entity.Province}
 */
@Value
public class ProvinceDto implements Serializable {
    Integer id;
    @NotNull
    @Size(max = 50)
    String provinceName;
}