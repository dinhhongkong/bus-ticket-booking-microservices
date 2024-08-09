package org.kong.managementservice.service;

import org.kong.managementservice.dto.DriverDto;

import java.util.List;

public interface DriverService {
    List<DriverDto> getAllDriver();
    DriverDto addNewDriver(DriverDto driver);

    DriverDto updateDriver(int id,DriverDto driver);

    void deleteDriverById(int id);

}
