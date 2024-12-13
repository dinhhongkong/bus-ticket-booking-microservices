package org.kong.paymentservice.service.impl;


import lombok.RequiredArgsConstructor;
import org.kong.paymentservice.config.PaymentStatusCode;
import org.kong.paymentservice.dto.request.PaymentTripRequest;
import org.kong.paymentservice.entity.Invoice;
import org.kong.paymentservice.entity.PaymentStatus;
import org.kong.paymentservice.entity.Ticket;
import org.kong.paymentservice.entity.TicketDetail;
import org.kong.paymentservice.exception.SeatNotAvailable;
import org.kong.paymentservice.repository.*;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class EmployeeService {
    private final TicketRepository ticketRepository;
    private final InvoiceRepository invoiceRepository;
    private final PaymentStatusRepository paymentStatusRepository;
    private final TicketDetailRepository ticketDetailRepository;
    private final TripRepository tripRepository;
    public int reservation(PaymentTripRequest request){
        List<String> seats = ticketRepository.findBookedSeats(request.getTrip().getId(),
                PaymentStatusCode.BOOKING,
                LocalDateTime.now().minusMinutes(15),
                PaymentStatusCode.SUCCESS);
        Set<String> seatNotAvailable = findCommonElements(seats, request.getTrip().getTickets());
        boolean checkSeat = true;
        String message = "";
        if (!seatNotAvailable.isEmpty()) {
            checkSeat = false;
            message = "Ghế " + seatNotAvailable.toString() + " tại chuyến đi được người khác chọn. ";
        }

        if (request.getReturnTrip()!= null) {
            List<String> returnSeats = ticketRepository.findBookedSeats(request.getTrip().getId(),
                    PaymentStatusCode.BOOKING,
                    LocalDateTime.now().minusMinutes(15),
                    PaymentStatusCode.SUCCESS);
            Set<String> returnSeatNotAvailable = findCommonElements(returnSeats, request.getTrip().getTickets());
            if (!seatNotAvailable.isEmpty()) {
                checkSeat = false;
                message = "Ghế " + returnSeatNotAvailable.toString() + " tại chuyến về được người khác chọn\n";
            }
        }

        if (!checkSeat) {
            throw new SeatNotAvailable(message);
        }


        // create invoice
        Invoice invoice = new Invoice();
        invoice.setDate(LocalDateTime.now());
        if (request.getUserId() != null) {
            invoice.setUserId(request.getUserId().toString());
        }
        invoice.setFullName(request.getName());
        invoice.setPhoneNumber(request.getPhoneNumber());
        invoice.setEmail(request.getEmail());
        invoice.setPaymentMethod(request.getPaymentMethod());

//        invoice.setPaymentMethod(request.getPaymentMethod());
        invoice.setStatus(PaymentStatusCode.SUCCESS);
        invoice = invoiceRepository.save(invoice);

        // create payment status
        PaymentStatus paymentStatus = new PaymentStatus();
        paymentStatus.setTimestamps(LocalDateTime.now());
        paymentStatus.setPaymentStatus(PaymentStatusCode.SUCCESS);
        paymentStatus.setInvoice(invoice);
        paymentStatusRepository.save(paymentStatus);

        createTicket(request.getTrip(),invoice, request.getTrip().getId() , request.getName(), request.getPhoneNumber(), request.getEmail());

        if (request.getReturnTrip().getId() != null) {
            Ticket ticketReturn = createTicket(request.getReturnTrip(),invoice,request.getReturnTrip().getId(), request.getName(), request.getPhoneNumber(), request.getEmail() );
            invoice.getTickets().add(ticketReturn);
            ticketDetailRepository.saveAll(ticketReturn.getTicketDetails());
        }

        return invoice.getId();
    }


    private Set<String> findCommonElements(List<String> list1, List<String> list2) {
        Set<String> commonElements = new LinkedHashSet<>();

        for (String element : list1) {
            if (list2.contains(element)) {
                commonElements.add(element);
            }
        }
        return commonElements;
    }

    private Ticket createTicket(PaymentTripRequest.DetailTrip request, Invoice invoice,int tripId, String name, String phone, String email) {
        Ticket ticket = new Ticket();
        ticket.setPickupPoint(request.getPickupId());
        ticket.setDropOffPoint(request.getDropOffId());
        ticket.setTrip(tripRepository.findById(tripId).get());
        ticket.setInvoice(invoice);
        ticket = ticketRepository.save(ticket);
        for (String seat: request.getTickets()) {
            TicketDetail ticketDetail = new TicketDetail();
            ticketDetail.setTicket(ticket);
            ticketDetail.setSeatName(seat);
            ticketDetail.setTicket(ticket);
            ticketDetailRepository.save(ticketDetail);
        }
        return ticket;

    }
}
