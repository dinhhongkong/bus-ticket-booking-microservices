package org.kong.paymentservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity(name = "Ticket")
@Table(name = "ticket")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ticket_id", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "pickup_point_id", nullable = false)
    private Integer pickupPoint;

    @NotNull
    @Column(name = "drop_off_point_id", nullable = false)
    private Integer dropOffPoint;

    @Lob
    @Column(name = "description")
    private String description;

//    @Size(max = 100)
//    @NotNull
//    @Column(name = "full_name", nullable = false, length = 100)
//    private String fullName;
//
//    @Size(max = 13)
//    @NotNull
//    @Column(name = "phone_number", nullable = false, length = 13)
//    private String phoneNumber;
//
//    @Size(max = 100)
//    @Column(name = "email", length = 100)
//    private String email;


//    @Column(name = "trip_id")
//    private Integer tripId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;

    @OneToMany(mappedBy = "ticket")
    private Set<TicketDetail> ticketDetails = new LinkedHashSet<>();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "trip_id")
    private Trip trip;

}