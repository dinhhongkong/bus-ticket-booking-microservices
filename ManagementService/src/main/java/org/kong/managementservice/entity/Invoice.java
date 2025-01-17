package org.kong.managementservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.time.LocalDateTime;
import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity(name = "Invoice")
@Table(name = "invoice")
public class Invoice {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "invoice_id", nullable = false)
    private Integer id;

    @Column(name = "date")
    private LocalDateTime date;

    @Size(max = 30)
    @Column(name = "payment_method", length = 30)
    private String paymentMethod;

    @Column(name = "status")
    private Byte status;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(mappedBy = "invoice")
    private Set<PaymentStatus> paymentStatuses = new LinkedHashSet<>();

    @OneToMany(mappedBy = "invoice")
    private Set<Ticket> tickets = new LinkedHashSet<>();

}