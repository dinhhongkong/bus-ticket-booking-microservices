package org.kong.managementservice.service.impl;

import lombok.RequiredArgsConstructor;
import org.kong.managementservice.dto.OfficeDto;
import org.kong.managementservice.dto.ProvinceDto;
import org.kong.managementservice.entity.Office;
import org.kong.managementservice.entity.Province;
import org.kong.managementservice.mapper.OfficeMapper;
import org.kong.managementservice.mapper.ProvinceMapper;
import org.kong.managementservice.repository.OfficeRepository;
import org.kong.managementservice.repository.ProvinceRepository;
import org.kong.managementservice.service.LocationService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LocationServiceImpl implements LocationService {
    private final ProvinceRepository provinceRepository;
    private final OfficeRepository officeRepository;
    private final ProvinceMapper provinceMapper;
    private final OfficeMapper officeMapper;
    @Override
    public List<ProvinceDto> getAllProvince() {
        List<Province> provinces = provinceRepository.findAll();
        return provinceMapper.toDto(provinces);
    }

    @Override
    public List<OfficeDto> getOfficeByProvinceId(int id) {
        List<Office> officeList = officeRepository.findByProvinceId(id);
        return officeMapper.toDto(officeList);
    }
}
