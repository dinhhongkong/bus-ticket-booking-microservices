package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Seat;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SeatRepository extends JpaRepository<Seat, Integer> {
}