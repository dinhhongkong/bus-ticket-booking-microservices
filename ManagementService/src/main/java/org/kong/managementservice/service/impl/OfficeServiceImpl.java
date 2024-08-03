package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.OfficeDto;
import org.kong.managementservice.entity.Office;
import org.kong.managementservice.entity.Province;
import org.kong.managementservice.mapper.OfficeMapper;
import org.kong.managementservice.repository.OfficeRepository;
import org.kong.managementservice.repository.ProvinceRepository;
import org.kong.managementservice.service.OfficeService;
import org.springframework.data.rest.webmvc.ResourceNotFoundException;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class OfficeServiceImpl implements OfficeService {
    private OfficeRepository officeRepository;
    private ProvinceRepository provinceRepository;
    private OfficeMapper officeMapper;

    @Override
    public List<OfficeDto> getAllOffice() {
        return officeMapper.toDto(officeRepository.findAll());
    }

    @Override
    public OfficeDto addNewOffice(OfficeDto officeDto) {
        Office office = officeMapper.toEntity(officeDto);
        office = officeRepository.save(office);
        return officeMapper.toDto(office);
    }

    @Override
    public OfficeDto updateOffice(int id, OfficeDto officeDto) {
        Optional<Office> office =  officeRepository.findById(id);
        if (office.isPresent()) {
            Office existingOffice = office.get();
            if (officeDto.getProvinceId()!= null) {
                Province province = provinceRepository.findById(officeDto.getProvinceId())
                        .orElseThrow(() -> new ResourceNotFoundException("Province not found with id " + officeDto.getProvinceId()));
                existingOffice.setProvince(province);
            }
            Office newOffice = officeMapper.partialUpdate(officeDto,existingOffice);
            newOffice = officeRepository.save(newOffice);
            return officeMapper.toDto(newOffice);
        }
        else {
            throw new ResourceNotFoundException("Office not found with id " + id);
        }

    }

    @Override
    public void deleteOfficeById(int id) {
        officeRepository.deleteById(id);

    }
}
