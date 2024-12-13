package org.kong.paymentservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
@Entity(name = "Journey")
@Table(name = "journey", schema = "bus_ticket_booking_db")
public class Journey {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "journey_id", nullable = false)
    private Integer id;

    @Column(name = "departure_time")
    private LocalTime departureTime;

    @Size(max = 10)
    @Column(name = "travel_time", length = 10)
    private String travelTime;

    @Column(name = "status")
    private Integer status;

}