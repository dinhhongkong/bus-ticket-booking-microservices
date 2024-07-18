package org.kong.bookingservice.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link org.kong.bookingservice.entity.Seat}
 */
@Value
public class SeatDto implements Serializable {
    Integer id;
    @NotNull
    Integer seatName;
}