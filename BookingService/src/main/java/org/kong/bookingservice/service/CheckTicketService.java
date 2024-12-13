package org.kong.bookingservice.service;

import org.kong.bookingservice.entity.TicketInformation;

public interface CheckTicketService {
    TicketInformation checkTicket(int ticketId, String phoneNumber);
}
