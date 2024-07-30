package org.kong.reportingservice.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity(name = "Price")
@Table(name = "price")
public class Price {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "price_id", nullable = false)
    private Integer id;

    @Column(name = "date_start")
    private LocalDate dateStart;

    @Column(name = "price")
    private Double price;

    @OneToMany(mappedBy = "price")
    private Set<Trip> trips = new LinkedHashSet<>();

}