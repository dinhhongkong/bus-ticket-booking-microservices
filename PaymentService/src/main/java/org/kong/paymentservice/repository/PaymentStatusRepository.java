package org.kong.paymentservice.repository;

import org.kong.paymentservice.entity.PaymentStatus;
import org.kong.paymentservice.entity.TicketDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface PaymentStatusRepository extends JpaRepository<PaymentStatus, Integer> {

}