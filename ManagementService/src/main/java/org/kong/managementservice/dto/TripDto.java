package org.kong.managementservice.dto;

import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Set;

/**
 * DTO for {@link org.kong.managementservice.entity.Trip}
 */
@Setter
@Getter
public class TripDto implements Serializable {
    Integer id;
    @NotNull
    LocalDate departureDay;
    LocalTime departureTime;
    Integer priceId;
    Double price;
    BusDto bus;
    Set<DriverDetailDto> driver;
    JourneyDetailDto departureOffice;
    JourneyDetailDto destinationOffice;
}