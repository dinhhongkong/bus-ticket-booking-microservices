package org.kong.reportingservice.dto.response;

import lombok.Getter;
import lombok.Setter;
import lombok.Value;

@Value
@Setter
@Getter
public class BusRateResponse {
    Double sleepingBed;
    Double limousine;

}
