package org.kong.managementservice.service;

import org.kong.managementservice.dto.JourneyDto;

import java.util.List;

public interface JourneyService {
    List<JourneyDto> getAllJourney();

    JourneyDto getJourneyById(int id);
    void addNewJourney(JourneyDto journey);
    void updateJourney(JourneyDto journey);
    void deleteJourneyById(int id);

}
