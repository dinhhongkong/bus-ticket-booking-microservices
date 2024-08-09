package org.kong.managementservice.service;

import org.kong.managementservice.dto.JourneyDto;
import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.entity.Trip;

import java.time.LocalDate;
import java.util.List;

public interface TripService {
    List<TripDto> getAllTripByJourneyId(int journeyId);
    List<TripDto> getTripByDayAndJourneyId(int journeyId, LocalDate date);
    void addNewTrip(TripDto tripDto);
    void updateTrip(TripDto tripDto);
    void deleteTrip(int id);
}
