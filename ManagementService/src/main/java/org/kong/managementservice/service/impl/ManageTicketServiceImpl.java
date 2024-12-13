package org.kong.managementservice.service.impl;

import lombok.RequiredArgsConstructor;
import org.kong.managementservice.config.PaymentStatusCode;
import org.kong.managementservice.entity.Invoice;
import org.kong.managementservice.entity.ManageTicket;
import org.kong.managementservice.entity.Ticket;
import org.kong.managementservice.exception.ResourceNotFoundException;
import org.kong.managementservice.repository.InvoiceRepository;
import org.kong.managementservice.repository.ManageTicketRepository;
import org.kong.managementservice.repository.TicketRepository;
import org.kong.managementservice.service.ManageTicketService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ManageTicketServiceImpl implements ManageTicketService {
    private final ManageTicketRepository manageTicketRepository;
    private final TicketRepository ticketRepository;
    private final InvoiceRepository invoiceRepository;
    @Override
    public List<ManageTicket> getByTripIdAndPhoneNumber(int tripId, String phoneNumber) {
        List<ManageTicket> list = new ArrayList<>();
        ManageTicket manageTicket = manageTicketRepository.findByTicketIdAndPhoneNumber(tripId, phoneNumber)
                .orElseThrow(()-> new ResourceNotFoundException("Not found manage ticket"));

        list.add(manageTicket);

        return list;
    }

    @Override
    public List<ManageTicket> getByPhoneNumber(String phoneNumber) {
        return manageTicketRepository.findByPhoneNumberOrderByTicketIdDesc(phoneNumber);
    }

    @Override
    public List<ManageTicket> checkTicket(int tripId, String phoneNumber) {
        if (tripId != 0) return getByTripIdAndPhoneNumber(tripId, phoneNumber);
        else return getByPhoneNumber(phoneNumber);
    }

    @Override
    public void cancelTicket(int ticketId) {
        Ticket ticket = ticketRepository.findById(ticketId).orElseThrow(()-> new ResourceNotFoundException("Not found ticket"));
        Invoice invoice = ticket.getInvoice();
        invoice.setStatus(PaymentStatusCode.CANCEL);
        invoiceRepository.save(invoice);
    }

    @Override
    public void paymentTicket(int ticketId) {
        Ticket ticket = ticketRepository.findById(ticketId).orElseThrow(()-> new ResourceNotFoundException("Not found ticket"));
        Invoice invoice = ticket.getInvoice();
        invoice.setPaymentMethod("Thanh toán tại quầy");
        invoiceRepository.save(invoice);
    }


}
