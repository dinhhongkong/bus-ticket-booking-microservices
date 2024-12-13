package org.kong.paymentservice.repository;

import org.kong.paymentservice.entity.TicketInformation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TicketInformationRepository extends JpaRepository<TicketInformation, Integer> {
    @Query("select t from Ticket_Information t where t.ticketId = ?1")
    TicketInformation findByTicketId(Integer ticketId);

}