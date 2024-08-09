package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.config.OfficeType;
import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.entity.*;
import org.kong.managementservice.mapper.BusMapper;
import org.kong.managementservice.mapper.DriverDetailMapper;
import org.kong.managementservice.mapper.JourneyDetailMapper;
import org.kong.managementservice.mapper.TripMapper;
import org.kong.managementservice.repository.TripRepository;
import org.kong.managementservice.service.TripService;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
@AllArgsConstructor
public class TripServiceImpl implements TripService {
    private TripRepository tripRepository;
    private TripMapper tripMapper;
    private JourneyDetailMapper journeyDetailMapper;
    private BusMapper busMapper;
    private DriverDetailMapper driverDetailMapper;
    @Override
    public List<TripDto> getAllTripByJourneyId(int journeyId) {
        List<Trip> tripList = tripRepository.findByJourneyId(journeyId);
        List<TripDto> tripDtoList = new ArrayList<>();

        for (Trip trip: tripList) {
            Set<DriverDetail> driverDetails = trip.getDriverDetails();
            Journey journey = trip.getJourney();
            Bus bus = trip.getBus();
            Price price = trip.getPrice();
            TripDto tripDto = tripMapper.toDto(trip);
            for (JourneyDetail journeyDetail: trip.getJourney().getJourneyDetails()) {
                if (journeyDetail.getType() == OfficeType.DEPARTURE) {
                    tripDto.setDestinationOffice( journeyDetailMapper.toDto(journeyDetail));
                }
                else if (journeyDetail.getType() == OfficeType.DESTINATION) {
                    tripDto.setDepartureOffice( journeyDetailMapper.toDto(journeyDetail));
                }
            }

            tripDto.setDepartureTime(journey.getDepartureTime());
            tripDto.setPriceId(price.getId());
            tripDto.setPrice(price.getPrice());
            tripDto.setBus(busMapper.toDto(bus));
            tripDto.setDriver(driverDetailMapper.toDto(driverDetails));

            tripDtoList.add(tripDto);
        }
        return tripDtoList;
    }

    @Override
    public List<TripDto> getTripByDayAndJourneyId(int journeyId, LocalDate date) {
        return null;
    }

    @Override
    public void addNewTrip(TripDto tripDto) {

    }

    @Override
    public void updateTrip(TripDto tripDto) {

    }

    @Override
    public void deleteTrip(int id) {

    }
}
