package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.PaymentStatus;
import org.kong.bookingservice.entity.TicketDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Collection;
import java.util.List;

public interface TicketDetailRepository extends JpaRepository<TicketDetail, Integer> {
}