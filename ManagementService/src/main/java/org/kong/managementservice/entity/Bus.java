package org.kong.managementservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity(name = "Bus")
@Table(name = "bus")
public class Bus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "bus_id", nullable = false)
    private Integer id;

    @Size(max = 20)
    @NotNull
    @Column(name = "license_plates", nullable = false, length = 20)
    private String licensePlates;

    @Column(name = "status")
    private Byte status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "type_id")
    private BusType type;

    @OneToMany(mappedBy = "bus")
    private Set<Trip> trips = new LinkedHashSet<>();

}