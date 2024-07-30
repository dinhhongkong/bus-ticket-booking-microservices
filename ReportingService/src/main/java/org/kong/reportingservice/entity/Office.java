package org.kong.reportingservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
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

    @Size(max = 100)
    @Column(name = "office_name", length = 100)
    private String officeName;

    @Size(max = 200)
    @Column(name = "address", length = 200)
    private String address;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "province_id")
    private Province province;

    @OneToMany(mappedBy = "office")
    private Set<JourneyDetail> journeyDetails = new LinkedHashSet<>();

    @OneToMany(mappedBy = "pickupPoint")
    private Set<Ticket> ticketsPickup = new LinkedHashSet<>();

    @OneToMany(mappedBy = "dropOffPoint")
    private Set<Ticket> ticketsDropOff = new LinkedHashSet<>();

}