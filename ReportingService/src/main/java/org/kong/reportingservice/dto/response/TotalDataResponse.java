package org.kong.reportingservice.dto.response;

import lombok.Value;

@Value
public class TotalDataResponse {
    Integer totalTrip;
    Integer totalTickets;
    Double totalIncome;
    Integer totalCustomer;
}
