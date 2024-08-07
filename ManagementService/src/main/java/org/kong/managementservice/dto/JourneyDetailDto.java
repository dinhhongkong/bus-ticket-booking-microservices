package org.kong.managementservice.dto;

import lombok.Value;

import java.io.Serializable;
import java.time.LocalTime;

/**
 * DTO for {@link org.kong.managementservice.entity.JourneyDetail}
 */
@Value
public class JourneyDetailDto implements Serializable {
    Integer id;
    LocalTime deltaTime;
    Integer officeId;
    String officeName;
    String officeAddress;
    String province;
    Integer type;
}