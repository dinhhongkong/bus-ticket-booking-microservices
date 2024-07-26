package org.kong.bookingservice.dto;

import lombok.Value;

import java.io.Serializable;
import java.time.LocalTime;

/**
 * DTO for {@link org.kong.bookingservice.entity.JourneyDetail}
 */
@Value
public class JourneyDetailDto implements Serializable {
    Integer officeId;
    LocalTime deltaTime;
    Integer type;
    String officeName;
    String address;
}