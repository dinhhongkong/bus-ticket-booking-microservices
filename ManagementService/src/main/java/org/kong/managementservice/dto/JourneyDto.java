package org.kong.managementservice.dto;

import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;
import java.time.LocalTime;
import java.util.List;

/**
 * DTO for {@link org.kong.managementservice.entity.Journey}
 */
@Value
public class JourneyDto implements Serializable {
    Integer id;
    LocalTime departureTime;
    @Size(max = 10)
    String travelTime;
    Integer status;
    JourneyDetailDto departureOffice;
    JourneyDetailDto destinationOffice;
    List<JourneyDetailDto> transferOffice;
    List<JourneyDetailDto> stopStation;

    @Override
    public String toString() {
        return "JourneyDto{" +
                "id=" + id +
                ", departureTime=" + departureTime +
                ", travelTime='" + travelTime + '\'' +
                ", status=" + status +
                ", departureOffice=" + departureOffice +
                ", destinationOffice=" + destinationOffice +
                ", transferOffice=" + transferOffice +
                ", stopStation=" + stopStation +
                '}';
    }
}