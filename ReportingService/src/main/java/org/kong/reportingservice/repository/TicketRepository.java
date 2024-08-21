package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketRepository extends JpaRepository<Ticket, Integer> {


}