package org.kong.reportingservice.dto.response;

import lombok.Getter;
import lombok.Setter;
import lombok.Value;

import java.util.List;

@Value
@Getter
@Setter
public class RevenueResponse {
    List<Double> sleepingBed;
    List<Double> limousine;
}
