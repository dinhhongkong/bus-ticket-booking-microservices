package org.kong.managementservice.service;

import org.kong.managementservice.dto.JourneyDto;

public interface JourneyService {
    void addNewJourney(JourneyDto journey);
    void updateJourney(JourneyDto journey);
    void deleteJourneyById(int id);

}
