package org.kong.paymentservice.repository;

import org.kong.paymentservice.entity.Ticket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface TicketRepository extends JpaRepository<Ticket, Integer> {

    @Query("""
            select ticketDetails.seatName from Ticket t inner join t.ticketDetails ticketDetails
            where t.trip.id = ?1 and ( (t.invoice.status = ?2 and t.invoice.date > ?3) or t.invoice.status = ?4)""")
    List<String> findBookedSeats(Integer tripId, Byte status, LocalDateTime dateTime, Byte status1);


}