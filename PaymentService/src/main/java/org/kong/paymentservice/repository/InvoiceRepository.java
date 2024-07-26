package org.kong.paymentservice.repository;

import org.kong.paymentservice.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer> {
    Invoice findById(int id);
}