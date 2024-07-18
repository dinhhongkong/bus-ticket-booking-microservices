package org.kong.bookingservice.service.impl;

import lombok.RequiredArgsConstructor;
import org.kong.bookingservice.dto.SeatDto;
import org.kong.bookingservice.dto.response.TripSearchDto;
import org.kong.bookingservice.entity.Journey;
import org.kong.bookingservice.entity.JourneyDetail;
import org.kong.bookingservice.entity.Seat;
import org.kong.bookingservice.entity.Trip;
import org.kong.bookingservice.mapper.SeatMapper;
import org.kong.bookingservice.repository.SeatRepository;
import org.kong.bookingservice.repository.TripRepository;
import org.kong.bookingservice.service.TripService;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class TripServiceImpl implements TripService {
    private final TripRepository tripRepository;
    private final SeatRepository seatRepository;
    private final SeatMapper seatMapper;

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

            if (start!= null && end!=null) {
                if (start.getDeltaTime().isBefore( end.getDeltaTime() )) {
                    tripSearch.add(new TripSearchDto(
                            trip.getId(),
                            trip.getDepartureDay(),
                            trip.getPrice().getPrice(),
                            trip.getJourney().getDepartureTime(),
                            trip.getJourney().getTravelTime(),
                            provinceStart,
                            provinceEnd
                    ));
                }
            }
        }

        return tripSearch;
    }

    @Override
    public List<SeatDto> getDisableSeatInTrip(int tripId) {
        List<Seat> seats = seatRepository.getDisableSeats(tripId, false);
        return seatMapper.toDto(seats);
    }
}
