package org.kong.managementservice.dto;

import lombok.Value;

import java.io.Serializable;
import java.time.LocalDate;

/**
 * DTO for {@link org.kong.managementservice.entity.Price}
 */
@Value
public class PriceDto implements Serializable {
    Integer id;
    LocalDate dateStart;
    Double price;
}