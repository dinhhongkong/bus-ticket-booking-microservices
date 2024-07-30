package org.kong.managementservice.service;

import org.kong.managementservice.dto.OfficeDto;

public interface OfficeService {
    OfficeDto addNewOffice(OfficeDto office);
    OfficeDto updateOffice(OfficeDto office);
    void deleteOfficeById(int id);
}
