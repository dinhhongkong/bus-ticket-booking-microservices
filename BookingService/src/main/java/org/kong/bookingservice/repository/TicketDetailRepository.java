package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.TicketDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TicketDetailRepository extends JpaRepository<TicketDetail, Integer> {
    @Query("select count(t) from Ticket_Detail t where t.ticket.trip.id = ?1")
    int countSeatOrder(Integer id);

}