package org.kong.managementservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

import java.time.LocalDate;
import java.time.LocalTime;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity(name = "Manage_Ticket")
@Immutable
@Table(name = "manage_ticket", schema = "bus_ticket_booking_db")
public class ManageTicket {
    @Id
    @Column(name = "ticket_id", nullable = false)
    private Integer ticketId;

    @Size(max = 100)
    @Column(name = "full_name", length = 100)
    private String fullName;

    @Size(max = 13)
    @Column(name = "phone_number", length = 13)
    private String phoneNumber;

    @Size(max = 100)
    @Column(name = "email", length = 100)
    private String email;

    @Column(name = "bus_id")
    private Integer busId;

    @Size(max = 20)
    @NotNull
    @Column(name = "license_plates", nullable = false, length = 20)
    private String licensePlates;

    @Size(max = 100)
    @Column(name = "pickup_point", length = 100)
    private String pickupPoint;

    @Size(max = 200)
    @Column(name = "pickup_address", length = 200)
    private String pickupAddress;

    @Size(max = 100)
    @Column(name = "drop_off_point", length = 100)
    private String dropOffPoint;

    @Size(max = 200)
    @Column(name = "drop_off_address", length = 200)
    private String dropOffAddress;

    @Size(max = 50)
    @NotNull
    @Column(name = "pickup_province", nullable = false, length = 50)
    private String pickupProvince;

    @Size(max = 50)
    @NotNull
    @Column(name = "dropoff_province", nullable = false, length = 50)
    private String dropoffProvince;

    @NotNull
    @Column(name = "departure_day", nullable = false)
    private LocalDate departureDay;

    @Column(name = "departure_time")
    private LocalTime departureTime;

    @Column(name = "delta_time")
    private LocalTime deltaTime;

    @Lob
    @Column(name = "seat_name")
    private String seatName;

    @NotNull
    @Column(name = "total_seat", nullable = false)
    private Long totalSeat;

    @Column(name = "price")
    private Double price;

    @Column(name = "is_cancel")
    private Boolean isCancel;

    @Column(name = "payment_method")
    private String paymentMethod;

    @Column(name = "invoice_status")
    private Integer invoiceStatus;

}