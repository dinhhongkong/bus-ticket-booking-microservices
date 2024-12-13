package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.TicketInformation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface TicketInformationRepository extends JpaRepository<TicketInformation, Integer> {
    @Query("select t from Ticket_Infomation t where t.ticketId = ?1 and t.phoneNumber = ?2 and t.isCancel = ?3")
    Optional<TicketInformation> findByTicketIdAndPhoneNumberAndIsCancel(Integer ticketId, String phoneNumber, Boolean isCancel);

    @Query("select t from Ticket_Infomation t where t.ticketId = ?1 and t.phoneNumber = ?2")
    Optional<TicketInformation> findByTicketIdAndPhoneNumber(Integer ticketId, String phoneNumber);


}