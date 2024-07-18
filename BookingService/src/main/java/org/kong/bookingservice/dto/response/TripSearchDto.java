package org.kong.bookingservice.dto.response;

import jakarta.validation.constraints.NotNull;
import lombok.Value;
import org.kong.bookingservice.entity.Office;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Set;

/**
 * DTO for {@link org.kong.bookingservice.entity.Trip}
 */
@Value
public class TripSearchDto implements Serializable {
    Integer id;
    @NotNull
    LocalDate departureDay;
    Double price;
    LocalTime departureTime;
    LocalTime travelTime;
    String departureProvince;
    String destProvince;
}