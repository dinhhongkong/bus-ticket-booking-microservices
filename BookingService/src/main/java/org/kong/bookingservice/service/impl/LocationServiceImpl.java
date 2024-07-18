package org.kong.bookingservice.service.impl;

import lombok.RequiredArgsConstructor;
import org.kong.bookingservice.dto.ProvinceDto;
import org.kong.bookingservice.entity.Province;
import org.kong.bookingservice.mapper.ProvinceMapper;
import org.kong.bookingservice.repository.ProvinceRepository;
import org.kong.bookingservice.service.LocationService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LocationServiceImpl implements LocationService {
    private final ProvinceRepository provinceRepository;
    private final ProvinceMapper provinceMapper;
    @Override
    public List<ProvinceDto> getAllProvince() {
        List<Province> provinces = provinceRepository.findAll();
        return provinceMapper.toDto(provinces);
    }
}
