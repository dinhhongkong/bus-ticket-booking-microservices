package org.kong.bookingservice.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity(name = "Journey")
@Table(name = "journey")
public class Journey {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "journey_id", nullable = false)
    private Integer id;

    @Column(name = "departure_time")
    private LocalTime departureTime;

    @Column(name = "travel_time")
    private String travelTime;

    @Column(name = "status")
    private Integer status;

    @OneToMany(mappedBy = "journey")
    private Set<JourneyDetail> journeyDetails = new LinkedHashSet<>();

    @OneToMany(mappedBy = "journey")
    private Set<Trip> trips = new LinkedHashSet<>();

}