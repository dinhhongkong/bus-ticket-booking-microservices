package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.config.OfficeType;
import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.dto.DriverDto;
import org.kong.managementservice.dto.TripDto;
import org.kong.managementservice.dto.request.TripCreateDto;
import org.kong.managementservice.entity.*;
import org.kong.managementservice.exception.ResourceNotFoundException;
import org.kong.managementservice.mapper.*;
import org.kong.managementservice.repository.*;
import org.kong.managementservice.service.TripService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
@AllArgsConstructor
public class TripServiceImpl implements TripService {
    private TripRepository tripRepository;
    private DriverRepository driverRepository;
    private BusRepository busRepository;
    private JourneyRepository journeyRepository;
    private PriceRepository priceRepository;
    private DriverDetailRepository driverDetailRepository;
    private TripMapper tripMapper;
    private JourneyDetailMapper journeyDetailMapper;
    private BusMapper busMapper;
    private DriverDetailMapper driverDetailMapper;
    private DriverMapper driverMapper;
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
    @Transactional
    public void addNewTrip(TripCreateDto tripDto) {
        Trip trip = new Trip();
        Journey journey = journeyRepository.findById(tripDto.getJourneyId())
                .orElseThrow(()-> new ResourceNotFoundException("Not found journey id " + tripDto.getJourneyId()));
        Optional<Price> priceOptional = priceRepository.findByPrice(tripDto.getPrice());
        Price price = null;
        if (priceOptional.isPresent())  {
            price = priceOptional.get();
        }
        else {
            price = new Price();
            price.setPrice(tripDto.getPrice());
            price.setDateStart(LocalDate.now());
            price = priceRepository.save(price);
        }
        Bus bus = busRepository.findById(tripDto.getBusId())
                .orElseThrow(()-> new ResourceNotFoundException("Not found bus id " + tripDto.getBusId()));


        trip.setJourney(journey);
        trip.setDepartureDay(tripDto.getDepartureDay());
        trip.setPrice(price);
        trip.setBus(bus);
        trip = tripRepository.save(trip);
        for (Integer driverId: tripDto.getDriverIdList()) {
            Driver driver = driverRepository.findById(driverId)
                    .orElseThrow(()-> new ResourceNotFoundException("Not found driver id " + driverId));
            DriverDetail driverDetail = new DriverDetail();
            DriverDetailId id = new DriverDetailId();
            id.setTripId(trip.getId());
            id.setDriverId(driver.getId());
            driverDetail.setId(id);
            driverDetail.setDriver(driver);
            driverDetail.setTrip(trip);
            driverDetailRepository.save(driverDetail);
        }
    }

    @Override
    @Transactional
    public void updateTrip(TripCreateDto tripDto) {
        Trip trip = tripRepository.findById(tripDto.getTripId())
                .orElseThrow(()-> new ResourceNotFoundException("Not found trip id " + tripDto.getTripId()));
        Journey journey = journeyRepository.findById(tripDto.getJourneyId())
                .orElseThrow(()-> new ResourceNotFoundException("Not found journey id " + tripDto.getJourneyId()));
        Optional<Price> priceOptional = priceRepository.findByPrice(tripDto.getPrice());
        Price price = null;
        if (priceOptional.isPresent())  {
            price = priceOptional.get();
        }
        else {
            price = new Price();
            price.setPrice(tripDto.getPrice());
            price.setDateStart(LocalDate.now());
            price = priceRepository.save(price);
        }
        Bus bus = busRepository.findById(tripDto.getBusId())
                .orElseThrow(()-> new ResourceNotFoundException("Not found bus id " + tripDto.getBusId()));


        trip.setJourney(journey);
        trip.setDepartureDay(tripDto.getDepartureDay());
        trip.setPrice(price);
        trip.setBus(bus);
        driverDetailRepository.deleteByTripId(tripDto.getTripId());
        trip = tripRepository.save(trip);

        for (Integer driverId: tripDto.getDriverIdList()) {
            Driver driver = driverRepository.findById(driverId)
                    .orElseThrow(()-> new ResourceNotFoundException("Not found driver id " + driverId));
            DriverDetail driverDetail = new DriverDetail();
            DriverDetailId id = new DriverDetailId();
            id.setTripId(trip.getId());
            id.setDriverId(driver.getId());
            driverDetail.setId(id);
            driverDetail.setDriver(driver);
            driverDetail.setTrip(trip);
            driverDetailRepository.save(driverDetail);
        }
    }

    @Override
    @Transactional
    public void deleteTrip(int id) {
        driverDetailRepository.deleteByTripId(id);
        tripRepository.deleteById(id);
    }

    @Override
    public List<DriverDto> getAllDriverAvailable(LocalDate localDate) {
        List<Driver> driverList = driverRepository.findByDriverAvailable(localDate);
        return driverMapper.toDto(driverList);
    }

    @Override
    public List<BusDto> getBusNotRunning(LocalDate localDate) {
        List<Bus> busList = busRepository.findByBusesNotRunningOnDate(localDate,1 );
        return busMapper.toDto(busList);
    }
}
