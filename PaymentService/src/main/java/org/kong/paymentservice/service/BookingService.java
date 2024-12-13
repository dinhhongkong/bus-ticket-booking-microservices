package org.kong.paymentservice.service;

import org.kong.paymentservice.dto.request.PaymentRequest;
import org.kong.paymentservice.dto.request.PaymentTripRequest;
import org.kong.paymentservice.dto.response.BookingInfoResponse;

public interface BookingService {
    int reservation(PaymentTripRequest request);

    void choosePaymentMethod(PaymentRequest paymentRequest);
    void completeBooking(int invoiceId);

    BookingInfoResponse bookingDetail(int invoiceId);
    void bookingFailed(int invoiceId);
}
