package org.kong.bookingservice.service.impl;

import org.kong.bookingservice.entity.TicketInformation;
import org.kong.bookingservice.exception.ResourceNotFound;
import org.kong.bookingservice.repository.TicketInformationRepository;
import org.kong.bookingservice.service.CheckTicketService;
import org.springframework.stereotype.Service;

@Service
public class CheckTicketServiceImpl implements CheckTicketService {
    private final TicketInformationRepository ticketInformationRepository;

    public CheckTicketServiceImpl(TicketInformationRepository ticketInformationRepository) {
        this.ticketInformationRepository = ticketInformationRepository;
    }

    @Override
    public TicketInformation checkTicket(int ticketId, String phoneNumber) {

        return ticketInformationRepository.findByTicketIdAndPhoneNumber(ticketId, phoneNumber)
                .orElseThrow(() -> new ResourceNotFound("Ticket not found"));
    }
}
