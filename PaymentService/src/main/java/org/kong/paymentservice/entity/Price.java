package org.kong.paymentservice.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity(name = "Price")
@Table(name = "price", schema = "bus_ticket_booking_db")
public class Price {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "price_id", nullable = false)
    private Integer id;

    @Column(name = "date_start")
    private LocalDate dateStart;

    @Column(name = "price")
    private Double price;

}