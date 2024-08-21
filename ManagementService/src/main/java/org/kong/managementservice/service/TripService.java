package org.kong.managementservice.service;

import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.dto.DriverDto;
import org.kong.managementservice.dto.JourneyDto;
import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.dto.request.TripCreateDto;
import org.kong.managementservice.entity.Trip;

import java.time.LocalDate;
import java.util.List;

public interface TripService {
    List<TripDto> getAllTripByJourneyId(int journeyId);
    List<TripDto> getTripByDayAndJourneyId(int journeyId, LocalDate date);
    void addNewTrip(TripCreateDto tripDto);
    void updateTrip(TripCreateDto tripDto);
    void deleteTrip(int id);

    List<DriverDto> getAllDriverAvailable(LocalDate localDate);
    List<BusDto> getBusNotRunning(LocalDate localDate);
}
