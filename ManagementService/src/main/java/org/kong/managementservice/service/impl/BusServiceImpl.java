package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.entity.Bus;
import org.kong.managementservice.mapper.BusMapper;
import org.kong.managementservice.repository.BusRepository;
import org.kong.managementservice.service.BusService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class BusServiceImpl implements BusService {
    private BusRepository busRepository;
    private BusMapper busMapper;


    @Override
    public List<BusDto> getAllBus() {
        List<Bus> buses = busRepository.findAll();
        return busMapper.toDto(buses);
    }

    @Override
    public BusDto addNewBus(BusDto busDto) {
        Bus bus = busMapper.toEntity(busDto);
        bus.setStatus((byte) 1);
        busRepository.save(bus);
        return busDto;
    }

    @Override
    public BusDto updateBus(BusDto busDto) {
        Bus bus = busMapper.toEntity(busDto);
        busRepository.save(bus);
        return busDto;
    }

    @Override
    public void deleteBusById(int id) {
        busRepository.deleteById(id);
    }
}
