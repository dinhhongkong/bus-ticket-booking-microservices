package org.kong.bookingservice.service;

import org.kong.bookingservice.dto.SeatDto;
import org.kong.bookingservice.dto.response.TripSearchDto;

import java.util.List;

public interface TripService {
    List<TripSearchDto> getSearchTrip(int departureProvinceId,
                                int destinationProvinceId,
                                String date);

    List<SeatDto> getDisableSeatInTrip(int tripId);
}