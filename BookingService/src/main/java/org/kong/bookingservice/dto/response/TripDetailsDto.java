package org.kong.bookingservice.dto.response;

import jakarta.validation.constraints.NotNull;
import lombok.Value;
import org.kong.bookingservice.dto.JourneyDetailDto;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Value
public class TripDetailsDto implements Serializable {
    Integer id;
    @NotNull
    LocalDate departureDay;
    Double price;
    LocalTime departureTime;
    String busType;
    String departureProvince;
    String destProvince;
    List<String> disableSeat;
    List<JourneyDetailDto> pickup;
    List<JourneyDetailDto> dropOff;
}