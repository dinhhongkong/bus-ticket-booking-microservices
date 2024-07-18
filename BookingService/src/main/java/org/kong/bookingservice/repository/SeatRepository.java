package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Seat;
import org.kong.bookingservice.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface SeatRepository extends JpaRepository<Seat, Integer> {

    @Query("""
            select s from Seat s inner join s.ticketDetails ticketDetails
            where ticketDetails.ticket.trip.id = ?1 and ticketDetails.ticket.invoice.isCancelled = ?2""")
    List<Seat> getDisableSeats(int tripId, boolean isCancel);



}