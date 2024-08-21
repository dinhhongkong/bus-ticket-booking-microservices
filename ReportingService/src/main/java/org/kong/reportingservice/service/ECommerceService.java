package org.kong.reportingservice.service;

import org.kong.reportingservice.dto.response.BusRateResponse;
import org.kong.reportingservice.dto.response.RevenueResponse;
import org.kong.reportingservice.dto.response.TotalDataResponse;

import java.time.LocalDate;

public interface ECommerceService {
    TotalDataResponse totalDataStatus();
    RevenueResponse monthlyRevenueInYear(int year);
    BusRateResponse ticketRate(int year);
    void topTrip();
}
