package org.kong.paymentservice.service.impl;

import lombok.RequiredArgsConstructor;
import org.kong.paymentservice.config.PaymentStatusCode;
import org.kong.paymentservice.dto.request.PaymentRequest;
import org.kong.paymentservice.dto.request.PaymentTripRequest;
import org.kong.paymentservice.dto.response.BookingInfoResponse;
import org.kong.paymentservice.entity.*;
import org.kong.paymentservice.exception.ResourceNotFound;
import org.kong.paymentservice.exception.SeatNotAvailable;
import org.kong.paymentservice.repository.*;
import org.kong.paymentservice.service.BookingService;
import org.kong.paymentservice.service.EmailService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@Service
@RequiredArgsConstructor
@Transactional
public class BookingServiceImpl implements BookingService {

    private final TicketRepository ticketRepository;
    private final InvoiceRepository invoiceRepository;
    private final PaymentStatusRepository paymentStatusRepository;
    private final TicketDetailRepository ticketDetailRepository;
    private final TripRepository tripRepository;
    private final EmailService emailService;
    private final TicketInformationRepository ticketInformationRepository;
    @Override
    public int reservation(PaymentTripRequest request) {
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

//        invoice.setPaymentMethod(request.getPaymentMethod());
        invoice.setStatus(PaymentStatusCode.BOOKING);
        invoice = invoiceRepository.save(invoice);

        // create payment status
        PaymentStatus paymentStatus = new PaymentStatus();
        paymentStatus.setTimestamps(LocalDateTime.now());
        paymentStatus.setPaymentStatus(PaymentStatusCode.BOOKING);
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

    @Override
    public void choosePaymentMethod(PaymentRequest paymentRequest) {
        Optional<Invoice> invoice = invoiceRepository.findById(paymentRequest.getInvoiceId());
        if (invoice.isPresent()) {
            Invoice invoiceCurrent = invoice.get();
            invoiceCurrent.setPaymentMethod(paymentRequest.getPaymentMethod());
            invoiceRepository.save(invoiceCurrent);
            return;
        }
        throw new ResourceNotFound("Not found invoiceId = " + paymentRequest.getInvoiceId());
    }

    @Override
    @Transactional
    public void completeBooking(int invoiceId) {
        Invoice invoice = invoiceRepository.findById(invoiceId);
        String mail = "";
        String subject = "Đặt vé thành công";
        String text = "";
        if (invoice != null) {
            mail = invoice.getEmail();
            invoice.setStatus(PaymentStatusCode.SUCCESS);
            invoiceRepository.save(invoice);
            PaymentStatus paymentStatus = new PaymentStatus();
            paymentStatus.setTimestamps(LocalDateTime.now());
            paymentStatus.setInvoice(invoice);
            paymentStatus.setPaymentStatus(PaymentStatusCode.SUCCESS);
            paymentStatusRepository.save(paymentStatus);
            for (Ticket ticket : invoice.getTickets()) {
                TicketInformation ticketInfo = ticketInformationRepository.findByTicketId(ticket.getId());
                text = """
    Thông Tin Vé:
    Mã vé: %s
    Họ tên: %s
    Số điện thoại: %s
    Email: %s
    Chuyến: %s - %s
    Điểm đón: %s - %s
    Điểm trả: %s - %s
    Ngày khởi hành: %s
    Giờ khởi hành: %s
    Ghế: %s
    Tổng số ghế: %d
    Giá vé: %s VND
    """.formatted(
                        ticketInfo.getTicketId(),
                        ticketInfo.getFullName(),
                        ticketInfo.getPhoneNumber(),
                        ticketInfo.getEmail(),
                        ticketInfo.getPickupProvince(),
                        ticketInfo.getDropoffProvince(),
                        ticket.getPickupPoint(),
                        ticketInfo.getPickupAddress(),
                        ticketInfo.getDropOffPoint(),
                        ticketInfo.getDropOffAddress(),
                        ticketInfo.getDepartureDay(),
                        ticketInfo.getDepartureTime(),
                        ticketInfo.getSeatName(),
                        ticketInfo.getTotalSeat(),
                        String.format("%,.2f", ticketInfo.getPrice() *  ticketInfo.getTotalSeat().doubleValue())
                );
                emailService.sendSimpleMessage(mail,subject,text);            }
            return;
        }
        throw new ResourceNotFound("Not found invoiceId = " + invoiceId);

    }

    @Override
    public BookingInfoResponse bookingDetail(int invoiceId) {
        Invoice invoice = invoiceRepository.findById(invoiceId);
        if (invoice == null) {
            throw new ResourceNotFound("Not found invoiceId = " + invoiceId);
        }
        BookingInfoResponse response = new BookingInfoResponse();
        response.setInvoiceId(invoice.getId());
        response.setFullName(invoice.getFullName());
        response.setPhoneNumber(invoice.getPhoneNumber());
        response.setEmail(invoice.getEmail());
        response.setStatus(invoice.getStatus().toString());
        response.setDateTime(invoice.getDate());


        var tickets = invoice.getTickets();
        tickets.forEach(ticket -> {
            var detailTrip = new BookingInfoResponse.DetailTrip();
            var seatsName = ticket.getTicketDetails().stream().map(ticketDetail -> ticketDetail.getSeatName()).toList();
            detailTrip.setTickets(seatsName);
            Trip trip = ticket.getTrip();
            detailTrip.setTripId(trip.getId());
            detailTrip.setDepartureDay(trip.getDepartureDay());
            detailTrip.setDepartureTime(trip.getJourney().getDepartureTime());
            detailTrip.setPrice(trip.getPrice().getPrice());
            response.getTrip().add(detailTrip);
        });
        return response;

    }

    @Override
    public void bookingFailed(int invoiceId) {
        Invoice invoice = invoiceRepository.findById(invoiceId);
        if (invoice != null) {
            invoice.setStatus(PaymentStatusCode.FAILURE);
            invoiceRepository.save(invoice);
            PaymentStatus paymentStatus = new PaymentStatus();
            paymentStatus.setTimestamps(LocalDateTime.now());
            paymentStatus.setInvoice(invoice);
            paymentStatus.setPaymentStatus(PaymentStatusCode.FAILURE);
            paymentStatusRepository.save(paymentStatus);
            return;
        }
        throw new ResourceNotFound("Not found invoiceId = " + invoiceId);
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
