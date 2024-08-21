package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket, Integer> {
    @Query("select t from Ticket t where t.trip.id = ?1 and t.invoice.status =?2")
    List<Ticket> findByTripId(Integer id, int status);

}