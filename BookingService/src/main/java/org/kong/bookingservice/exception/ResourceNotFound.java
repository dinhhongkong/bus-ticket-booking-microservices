package org.kong.bookingservice.exception;

public class ResourceNotFound extends RuntimeException{
    public ResourceNotFound(String message) {
        super(message);
    }
}
