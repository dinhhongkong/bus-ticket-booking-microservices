package org.kong.paymentservice.dto.request;

import lombok.Data;
import lombok.Value;

import java.util.List;


@Value
public class PaymentTripRequest {
    Integer userId;
    DetailTrip trip;
    DetailTrip returnTrip;
    String name;
    String phoneNumber;
    String email;
    String paymentMethod;
    Integer amount;


    @Data
    public static class DetailTrip {
        private Integer id;
        private List<String> tickets;
        private Integer pickupId;
        private Integer dropOffId;
    }
}
