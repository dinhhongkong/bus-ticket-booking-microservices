package org.kong.managementservice.dto.request;

import lombok.Data;

import java.time.LocalDate;
import java.util.List;

@Data
public class TripCreateDto {
    Integer tripId;
    Integer journeyId;
    LocalDate departureDay;
    Double price;
    Integer busId;
    List<Integer> driverIdList;

}
