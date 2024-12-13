package org.kong.paymentservice.dto.request;

import lombok.Value;

import java.util.List;

@Value
public class CreateOrderRequest {
    Integer userId;
    String name;
    String phoneNumber;
    String email;
    Ticket departureTicket;
    Ticket returnTicket;

    public static class Ticket {
        int tripId;
        List<String> tickets;
        private Integer pickupId;
        private Integer dropOffId;
    }
}
