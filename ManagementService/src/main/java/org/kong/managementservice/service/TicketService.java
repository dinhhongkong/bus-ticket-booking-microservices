package org.kong.managementservice.service;

import org.kong.managementservice.dto.TicketDto;

import java.util.List;

public interface TicketService {
    List<TicketDto> getAllTicketInTrip(int tripId);
    void deleteTicket(int ticketId);
}
