package org.kong.managementservice.dto;

import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.Set;

/**
 * DTO for {@link org.kong.managementservice.entity.Journey}
 */
@Value
public class JourneyDto implements Serializable {
    Integer id;
    LocalTime departureTime;
    @Size(max = 10)
    String travelTime;
    Integer status;
    Set<JourneyDetailDto> journeyDetails;
}