package org.kong.paymentservice.exception;

public class SeatNotAvailable extends RuntimeException{
    public SeatNotAvailable(String message) {
        super(message);
    }
}
