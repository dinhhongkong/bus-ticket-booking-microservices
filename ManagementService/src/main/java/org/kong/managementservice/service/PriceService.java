package org.kong.managementservice.service;

import org.kong.managementservice.dto.PriceDto;

import java.util.List;

public interface PriceService {
    List<PriceDto> getAllPrice();
    PriceDto createPrice(PriceDto priceDto);
    void deletePrice(int id);
}
