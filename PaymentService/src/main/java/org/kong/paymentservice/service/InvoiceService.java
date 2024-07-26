package org.kong.paymentservice.service;

import org.kong.paymentservice.dto.request.PaymentTripRequest;

public interface InvoiceService {
    String reservation(PaymentTripRequest request);
    void completeBooking(int invoiceId);
    void bookingFailed(int invoiceId);
}
