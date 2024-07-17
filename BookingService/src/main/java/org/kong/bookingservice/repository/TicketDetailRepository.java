package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.TicketDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TicketDetailRepository extends JpaRepository<TicketDetail, Integer> {
}