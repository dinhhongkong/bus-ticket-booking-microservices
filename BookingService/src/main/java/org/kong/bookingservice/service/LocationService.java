package org.kong.bookingservice.service;

import org.kong.bookingservice.dto.ProvinceDto;

import java.util.List;

public interface LocationService {
    List<ProvinceDto> getAllProvince();
}
