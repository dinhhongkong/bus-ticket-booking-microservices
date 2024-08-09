package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.DriverDto;
import org.kong.managementservice.entity.Driver;
import org.kong.managementservice.exception.ResourceNotFoundException;
import org.kong.managementservice.mapper.DriverMapper;
import org.kong.managementservice.repository.DriverRepository;
import org.kong.managementservice.service.DriverService;
import org.springframework.stereotype.Service;

import java.util.List;
@AllArgsConstructor
@Service
public class DriverServiceImpl implements DriverService {
    private DriverRepository driverRepository;
    private DriverMapper driverMapper;
    @Override
    public List<DriverDto> getAllDriver() {
        List<Driver> driverList = driverRepository.findAll();
        return driverMapper.toDto(driverList);
    }

    @Override
    public DriverDto addNewDriver(DriverDto driverDto) {
        Driver driver = driverMapper.toEntity(driverDto);
        driver = driverRepository.save(driver);
        return driverMapper.toDto(driver);
    }

    @Override
    public DriverDto updateDriver(int id, DriverDto driverDto) {
        Driver driver = driverRepository.findById(id)
                .orElseThrow(()-> new ResourceNotFoundException("Not found driver with id " + id));
        driver = driverMapper.partialUpdate(driverDto, driver);
        driver = driverRepository.save(driver);
        return driverMapper.toDto(driver);
    }

    @Override
    public void deleteDriverById(int id) {
        driverRepository.deleteById(id);

    }
}
