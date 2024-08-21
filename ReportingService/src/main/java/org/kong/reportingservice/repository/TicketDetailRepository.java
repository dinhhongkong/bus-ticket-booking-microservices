package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.TicketDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TicketDetailRepository extends JpaRepository<TicketDetail, Integer> {
    @Query("select count(t) from Ticket_Detail t where t.ticket.id = ?1")
    int countByTicketId(Integer id);

    @Query("select count(t) from Ticket_Detail t where t.ticket.invoice.status = ?1")
    int countByOrderTicket(Byte status);


}