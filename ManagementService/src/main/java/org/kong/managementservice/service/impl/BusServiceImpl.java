package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.BusDto;
import org.kong.managementservice.entity.Bus;
import org.kong.managementservice.entity.BusType;
import org.kong.managementservice.mapper.BusMapper;
import org.kong.managementservice.repository.BusRepository;
import org.kong.managementservice.repository.BusTypeRepository;
import org.kong.managementservice.service.BusService;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
@Transactional
public class BusServiceImpl implements BusService {
    private BusRepository busRepository;
    private BusTypeRepository busTypeRepository;
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
    public BusDto updateBus(int id, BusDto busDto) {
        Optional<Bus> bus = busRepository.findById(id);
        if(bus.isPresent()) {
            Bus existingBus = bus.get();
            if (busDto.getTypeId() != null) {
                BusType busType =  busTypeRepository.findById(busDto.getTypeId())
                        .orElseThrow(() -> new ResourceNotFoundException("BusType not found with id " + busDto.getTypeId()));
                existingBus.setType(busType);
            }
            Bus newBus = busMapper.partialUpdate(busDto, existingBus);
            System.out.println("new bus " +  newBus.getType().getId() + " id " + newBus.getType().getId());
            newBus = busRepository.save(newBus);
            return busMapper.toDto(newBus);
        }
        else {
            throw new ResourceNotFoundException("Bus not found with id " + id);
        }

    }

    @Override
    public void deleteBusById(int id) {
        busRepository.deleteById(id);
    }
}
