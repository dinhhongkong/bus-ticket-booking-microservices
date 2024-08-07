package org.kong.managementservice.service;

import org.kong.managementservice.dto.OfficeDto;
import org.kong.managementservice.dto.ProvinceDto;

import java.util.List;

public interface LocationService {
    List<ProvinceDto> getAllProvince();

    List<OfficeDto> getOfficeByProvinceId(int id);
}
