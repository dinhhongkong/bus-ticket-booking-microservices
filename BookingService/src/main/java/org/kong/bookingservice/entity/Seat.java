package org.kong.bookingservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity(name = "Seat")
@Table(name = "seat")
public class Seat {
    @Id
    @Column(name = "seat_id", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "seat_name", nullable = false)
    private Integer seatName;

    @NotNull
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "bus_type_id", nullable = false)
    private BusType busType;

    @OneToMany(mappedBy = "seat")
    private Set<TicketDetail> ticketDetails = new LinkedHashSet<>();

}