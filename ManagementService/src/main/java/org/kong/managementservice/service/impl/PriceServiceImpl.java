package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.PriceDto;
import org.kong.managementservice.entity.Price;
import org.kong.managementservice.mapper.PriceMapper;
import org.kong.managementservice.repository.PriceRepository;
import org.kong.managementservice.service.PriceService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class PriceServiceImpl implements PriceService {
    private PriceRepository priceRepository;
    private PriceMapper priceMapper;

    @Override
    public List<PriceDto> getAllPrice() {
        List<Price> priceList = priceRepository.findAll();
        return priceMapper.toDto(priceList);
    }

    @Override
    public PriceDto createPrice(PriceDto priceDto) {
        Price price = priceMapper.toEntity(priceDto);
        price = priceRepository.save(price);
        return priceMapper.toDto(price);
    }

    @Override
    public void deletePrice(int id) {
        priceRepository.deleteById(id);
    }


}
