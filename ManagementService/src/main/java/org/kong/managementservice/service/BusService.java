package org.kong.managementservice.service;

import org.kong.managementservice.dto.BusDto;

import java.util.List;

public interface BusService {

    List<BusDto> getAllBus();
    BusDto addNewBus(BusDto busDto);

    BusDto updateBus(int id,BusDto busDto);

    void deleteBusById(int id);
}
