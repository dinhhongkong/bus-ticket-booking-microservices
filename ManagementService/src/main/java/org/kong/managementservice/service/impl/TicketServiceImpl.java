package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.dto.TicketDto;
import org.kong.managementservice.entity.Ticket;
import org.kong.managementservice.mapper.TicketMapper;
import org.kong.managementservice.repository.TicketDetailRepository;
import org.kong.managementservice.repository.TicketRepository;
import org.kong.managementservice.service.TicketService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@AllArgsConstructor
public class TicketServiceImpl implements TicketService {
    private TicketRepository ticketRepository;
    private TicketDetailRepository ticketDetailRepository;
    private TicketMapper ticketMapper;
    @Override
    public List<TicketDto> getAllTicketInTrip(int tripId) {
        List<Ticket> ticketList = ticketRepository.findByTripId(tripId,1);
        return ticketMapper.toDto(ticketList);
    }

    @Override
    @Transactional
    public void deleteTicket(int ticketId) {
        ticketDetailRepository.deleteByTicket(ticketId);
        ticketRepository.deleteById(ticketId);
    }
}
