package org.kong.managementservice.dto;

import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.managementservice.entity.Office}
 */
@Value
public class OfficeDto implements Serializable {
    Integer id;
    @Size(max = 100)
    String officeName;
    @Size(max = 200)
    String address;
    Integer provinceId;
    String provinceName;
}