package org.kong.reportingservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.reportingservice.config.BusTypeCode;
import org.kong.reportingservice.config.PaymentStatusCode;
import org.kong.reportingservice.dto.response.BusRateResponse;
import org.kong.reportingservice.dto.response.RevenueResponse;
import org.kong.reportingservice.dto.response.TotalDataResponse;
import org.kong.reportingservice.entity.Invoice;
import org.kong.reportingservice.entity.Ticket;
import org.kong.reportingservice.entity.TicketDetail;
import org.kong.reportingservice.repository.*;
import org.kong.reportingservice.service.ECommerceService;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Set;

@Service
@AllArgsConstructor
public class ECommerceServiceImpl implements ECommerceService {
    private InvoiceRepository invoiceRepository;
    private TicketDetailRepository ticketDetailRepository;
    private TripRepository tripRepository;
    private CustomerRepository customerRepository;
    private UserRepository userRepository;
    @Override
    public TotalDataResponse totalDataStatus() {
        int totalTrip =0;
        int totalTickets = 0;
        double totalIncome = 0.0;
        int totalCustomer = 0;
        totalTrip = tripRepository.countTrip();
        totalTickets = ticketDetailRepository.countByOrderTicket(PaymentStatusCode.SUCCESS);
        List<Invoice> invoiceList = invoiceRepository.findByStatus(PaymentStatusCode.SUCCESS);
        for (Invoice invoice: invoiceList) {
            Set<Ticket> ticketSet = invoice.getTickets();
            for (Ticket ticket: ticketSet) {
                double price = ticket.getTrip().getPrice().getPrice();
                int count =  ticketDetailRepository.countByTicketId(ticket.getId());
                totalIncome += price*count;
            }
        }
        totalCustomer = userRepository.countByRoleName(true,"CUSTOMER");
        return new TotalDataResponse(totalTrip, totalTickets,totalIncome,totalCustomer);

    }

    @Override
    public RevenueResponse monthlyRevenueInYear(int year) {

        // Ngày bắt đầu của năm
        LocalDateTime startOfYear = LocalDateTime.of(year, Month.JANUARY, 1,0,0);

        // Ngày cuối cùng của năm
        LocalDateTime endOfYear = LocalDateTime.of(year, Month.DECEMBER, 31,23,59);

        List<Double> responseSleepingBed = new ArrayList<>(Collections.nCopies(12, 0.0));
        List<Invoice> invoiceSleepingBed = invoiceRepository.findInvoiceByDayAndType(startOfYear, endOfYear, PaymentStatusCode.SUCCESS, BusTypeCode.SLEEPING_BED);
        for (Invoice invoice : invoiceSleepingBed) {
            int month = invoice.getDate().getMonth().getValue();
            int index = month -1;

            Set<Ticket> ticketSet = invoice.getTickets();
            for (Ticket ticket: ticketSet) {
                double price = ticket.getTrip().getPrice().getPrice();
                int count =  ticketDetailRepository.countByTicketId(ticket.getId());
                double total = responseSleepingBed.get(count);
                responseSleepingBed.set(index, total + price* count);
            }
        }

        List<Double> responseLimousine = new ArrayList<>(Collections.nCopies(12, 0.0));
        List<Invoice> invoiceLimousine = invoiceRepository.findInvoiceByDayAndType(startOfYear, endOfYear, PaymentStatusCode.SUCCESS, BusTypeCode.LIMOUSINE);
        for (Invoice invoice : invoiceLimousine) {
            int month = invoice.getDate().getMonth().getValue();
            int index = month -1;

            Set<Ticket> ticketSet = invoice.getTickets();
            for (Ticket ticket: ticketSet) {
                double price = ticket.getTrip().getPrice().getPrice();
                int count =  ticketDetailRepository.countByTicketId(ticket.getId());
                double total = responseLimousine.get(count);
                responseLimousine.set(index, total + price* count);
            }
        }

        return new RevenueResponse(responseSleepingBed, responseLimousine);
    }

    @Override
    public BusRateResponse ticketRate(int year) {
        // Ngày bắt đầu của năm
        LocalDateTime startOfYear = LocalDateTime.of(year, Month.JANUARY, 1,0,0);

        // Ngày cuối cùng của năm
        LocalDateTime endOfYear = LocalDateTime.of(year, Month.DECEMBER, 31,23,59);

        int countLimousine = 0;
        List<Invoice> invoiceSleepingBed = invoiceRepository.findInvoiceByDayAndType(startOfYear, endOfYear, PaymentStatusCode.SUCCESS, BusTypeCode.SLEEPING_BED);
        for (Invoice invoice : invoiceSleepingBed) {


            Set<Ticket> ticketSet = invoice.getTickets();
            for (Ticket ticket: ticketSet) {
                countLimousine +=  ticketDetailRepository.countByTicketId(ticket.getId());
            }
        }

        int countSleepingBed = 0;
        List<Invoice> invoiceLimousine = invoiceRepository.findInvoiceByDayAndType(startOfYear, endOfYear, PaymentStatusCode.SUCCESS, BusTypeCode.LIMOUSINE);
        for (Invoice invoice : invoiceLimousine) {
            Set<Ticket> ticketSet = invoice.getTickets();
            for (Ticket ticket: ticketSet) {
                countSleepingBed +=  ticketDetailRepository.countByTicketId(ticket.getId());
            }
        }
        int total = countLimousine + countSleepingBed;
        if (total == 0) {
            return new BusRateResponse(0.0,0.0);
        }

        return new BusRateResponse(((double)countSleepingBed/total)*100.0,
                ((double) countLimousine/total)*100.0);
    }


    @Override
    public void topTrip() {


    }
}
