package org.kong.managementservice.service;

import org.kong.managementservice.dto.OfficeDto;

import java.util.List;

public interface OfficeService {

    List<OfficeDto> getAllOffice();
    OfficeDto addNewOffice(OfficeDto office);
    OfficeDto updateOffice(int id,OfficeDto office);
    void deleteOfficeById(int id);
}
