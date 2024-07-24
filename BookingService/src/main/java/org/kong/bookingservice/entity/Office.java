package org.kong.bookingservice.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity(name = "Office")
@Table(name = "office")
public class Office {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "office_id", nullable = false)
    private Integer id;

    @Column(name = "office_name")
    private String officeName;

    @Column(name = "address")
    private String address;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "province_id")
    private Province province;

    @OneToMany(mappedBy = "office")
    private Set<JourneyDetail> journeyDetails = new LinkedHashSet<>();

    @OneToMany(mappedBy = "pickupPoint")
    private Set<Ticket> pickupPointOfTickets = new LinkedHashSet<>();

    @OneToMany(mappedBy = "dropOffPoint")
    private Set<Ticket> dropOffPointOftickets = new LinkedHashSet<>();

}