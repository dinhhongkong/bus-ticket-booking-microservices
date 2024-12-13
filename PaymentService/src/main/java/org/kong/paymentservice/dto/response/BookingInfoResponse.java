package org.kong.paymentservice.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BookingInfoResponse {
    private Integer invoiceId;
    private String status;
    private LocalDateTime dateTime;
    private String fullName;
    private String phoneNumber;
    private String email;
    private List<DetailTrip> trip = new ArrayList<>();



    @Data
    @AllArgsConstructor
    @NoArgsConstructor
    @Builder
    public static class DetailTrip {
        private Integer tripId;
        private List<String> tickets;
        private LocalDate departureDay;
        private LocalTime departureTime;
        private double price;
    }
}
