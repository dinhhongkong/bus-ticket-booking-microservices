package org.kong.managementservice.repository;

import org.kong.managementservice.entity.ManageTicket;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface ManageTicketRepository extends JpaRepository<ManageTicket, Integer> {
    @Query("select m from Manage_Ticket m where m.ticketId = ?1 and m.phoneNumber = ?2")
    Optional<ManageTicket> findByTicketIdAndPhoneNumber(Integer ticketId, String phoneNumber);

    @Query("select m from Manage_Ticket m where m.phoneNumber = ?1 order by m.ticketId DESC")
    List<ManageTicket> findByPhoneNumberOrderByTicketIdDesc(String phoneNumber);


}