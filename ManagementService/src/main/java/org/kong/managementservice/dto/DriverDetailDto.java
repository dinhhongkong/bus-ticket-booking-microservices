package org.kong.managementservice.dto;

import lombok.Value;
import org.kong.managementservice.entity.DriverDetail;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * DTO for {@link DriverDetail}
 */
@Value
public class DriverDetailDto implements Serializable {
    Integer driverId;
    String driverFullName;
}