package org.kong.bookingservice.service.impl;

import lombok.RequiredArgsConstructor;
import org.kong.bookingservice.config.OfficeType;
import org.kong.bookingservice.config.SeatConfig;
import org.kong.bookingservice.dto.JourneyDetailDto;
import org.kong.bookingservice.dto.response.TripDetailsDto;
import org.kong.bookingservice.dto.response.TripSearchDto;
import org.kong.bookingservice.entity.*;
import org.kong.bookingservice.exception.ResourceNotFound;
import org.kong.bookingservice.mapper.JourneyDetailMapper;
import org.kong.bookingservice.repository.TicketDetailRepository;
import org.kong.bookingservice.repository.TripRepository;
import org.kong.bookingservice.service.TripService;
import org.kong.bookingservice.utils.LocalTimeUtils;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class TripServiceImpl implements TripService {
    private final TripRepository tripRepository;
    private final TicketDetailRepository ticketDetailRepository;
    private final JourneyDetailMapper journeyDetailMapper;

    @Override
    public List<TripSearchDto> getSearchTrip(int departureProvinceId, int destinationProvinceId, String date) {
        ArrayList<TripSearchDto> tripSearch = new ArrayList<>();
        List<Trip> tripList = tripRepository.findByDepartureDay(LocalDate.parse(date));
        for (Trip trip: tripList) {
            JourneyDetail start = null;
            JourneyDetail end = null;
            String provinceStart ="";
            String provinceEnd = "";
            Set<JourneyDetail> journeyDetails = trip.getJourney().getJourneyDetails();
            for (JourneyDetail journeyDetail: journeyDetails) {
                if (journeyDetail.getOffice().getProvince().getId() == departureProvinceId) {
                    start = journeyDetail;
                    provinceStart = journeyDetail.getOffice().getProvince().getProvinceName();
                    break;
                }
            }

            for (JourneyDetail journeyDetail: journeyDetails) {
                if (journeyDetail.getOffice().getProvince().getId() == destinationProvinceId) {
                    end = journeyDetail;
                    provinceEnd = journeyDetail.getOffice().getProvince().getProvinceName();
                    break;
                }
            }

            BusType busType = trip.getBus().getType();
            int orderSeat =  ticketDetailRepository.countSeatOrder(trip.getId());
            int emptySeat = 0;

            if (busType.getId() == SeatConfig.SLEEPING_ID) {
                emptySeat = SeatConfig.SLEEPING_SEAT - orderSeat;

            }
            else if (busType.getId() == SeatConfig.LIMOUSINE_ID) {
                emptySeat = SeatConfig.LIMOUSINE_SEAT - orderSeat;
            }


            if (start!= null && end!=null) {
                if (start.getDeltaTime().isBefore( end.getDeltaTime() )) {
                    LocalTime startTime = trip.getJourney().getDepartureTime();
                    String travelTime = trip.getJourney().getTravelTime();
                    LocalTime endTime = LocalTimeUtils.plusStringAndLocalTime(travelTime,startTime);
                    tripSearch.add(new TripSearchDto(
                            trip.getId(),
                            trip.getDepartureDay(),
                            trip.getPrice().getPrice(),
                            startTime,
                            travelTime,
                            endTime,
                            trip.getBus().getType().getTypeName(),
                            emptySeat,
                            provinceStart,
                            provinceEnd
                    ));
                }
            }
        }

        return tripSearch;
    }



    @Override
    public TripDetailsDto getDetailsTrip(int id) {
        Optional<Trip> trip = tripRepository.findById(id);
        if (trip.isPresent()) {
            Journey journey =  trip.get().getJourney();
            String startProvince ="";
            String endProvince = "";
            List<String> disableSeat = new ArrayList<>();
            List<JourneyDetailDto> pickup = new ArrayList<>();
            List<JourneyDetailDto> dropOff = new ArrayList<>();
            for (JourneyDetail item: journey.getJourneyDetails()) {
                if(item.getType() == OfficeType.DEPARTURE) {
                    startProvince = item.getOffice().getProvince().getProvinceName();
                    item.setDeltaTime(journey.getDepartureTime());
                    pickup.add(journeyDetailMapper.toDto(item));
                }
                else if ( item.getType() == OfficeType.DESTINATION) {
                    endProvince =  item.getOffice().getProvince().getProvinceName();
                    LocalTime localTime = LocalTimeUtils.plusStringAndLocalTime(journey.getTravelTime(), journey.getDepartureTime());
                    item.setDeltaTime(localTime);
                    dropOff.add(journeyDetailMapper.toDto(item));
                }
                else if (item.getType() == OfficeType.TRANSFER) {
                    LocalTime localTime = LocalTimeUtils.minusLocalTimes( journey.getDepartureTime(), item.getDeltaTime());
                    item.setDeltaTime(localTime);
                    pickup.add(journeyDetailMapper.toDto(item));
                }
                else if (item.getType() == OfficeType.STOP_STATION) {
                    LocalTime localTime = LocalTimeUtils.plusLocalTimes(journey.getDepartureTime(), item.getDeltaTime());
                    item.setDeltaTime(localTime);
                    pickup.add(journeyDetailMapper.toDto(item));
                }
            }


            for (Ticket ticket: trip.get().getTickets()) {
                for (TicketDetail ticketDetail: ticket.getTicketDetails()) {
                    String seatName = ticketDetail.getSeatName();
                    disableSeat.add(seatName);
                }
            }

            return new TripDetailsDto(
                    trip.get().getId(),
                    trip.get().getDepartureDay(),
                    trip.get().getPrice().getPrice(),
                    journey.getDepartureTime(),
                    trip.get().getBus().getType().getTypeName(),
                    startProvince,
                    endProvince,
                    disableSeat,
                    pickup,
                    dropOff
                    );
        }
        throw  new ResourceNotFound("Not found trip");
    }
}
