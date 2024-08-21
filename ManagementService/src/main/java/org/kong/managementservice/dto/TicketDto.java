package org.kong.managementservice.dto;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Value;

import java.io.Serializable;
import java.time.Instant;
import java.util.Set;

/**
 * DTO for {@link org.kong.managementservice.entity.Ticket}
 */
@Value
public class TicketDto implements Serializable {
    Integer id;
    String pickup;
    String dropOff;
    @NotNull
    @Size(max = 100)
    String fullName;
    @NotNull
    @Size(max = 13)
    String phoneNumber;
    @Size(max = 100)
    String email;
    Instant invoiceCreationDate;
    String paymentMethod;
    Byte invoiceStatus;
    Set<String> ticketDetailSeatNames;
}