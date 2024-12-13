package org.kong.managementservice.service;

import org.kong.managementservice.entity.ManageTicket;

import java.util.List;

public interface ManageTicketService {
    List<ManageTicket> getByTripIdAndPhoneNumber(int tripId, String phoneNumber);

    List<ManageTicket> getByPhoneNumber(String phoneNumber);

    List<ManageTicket> checkTicket(int tripId, String phoneNumber);

    void cancelTicket(int ticketId);

    void paymentTicket(int ticketId);
}
