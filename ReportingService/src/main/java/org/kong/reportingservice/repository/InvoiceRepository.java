package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.Invoice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDateTime;
import java.util.List;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer> {
    @Query("""
            select i from Invoice i inner join i.tickets tickets
            where i.date >= ?1 and i.date <= ?2 and i.status = ?3 and tickets.trip.bus.type.id = ?4""")
    List<Invoice> findInvoiceByDayAndType(LocalDateTime startOfYear, LocalDateTime endOfYear, Byte status, int typeId);

    @Query("select i from Invoice i where i.status = ?1")
    List<Invoice> findByStatus(Byte status);


}