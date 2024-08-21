package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Ticket;
import org.kong.managementservice.entity.TicketDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface TicketDetailRepository extends JpaRepository<TicketDetail, Integer> {
    @Transactional
    @Modifying
    @Query("delete from Ticket_Detail t where t.ticket.id = ?1")
    int deleteByTicket(int ticketId);

}