package org.kong.paymentservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Null;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

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

    @Size(max = 100)
    @NotNull
    @Column(name = "full_name", nullable = false, length = 100)
    private String fullName;

    @Size(max = 13)
    @NotNull
    @Column(name = "phone_number", nullable = false, length = 13)
    private String phoneNumber;

    @Size(max = 100)
    @Column(name = "email", length = 100)
    private String email;

    @Column(name = "user_id")
    private String userId;

    @OneToMany(mappedBy = "invoice")
    private Set<PaymentStatus> paymentStatuses = new LinkedHashSet<>();

    @OneToMany(mappedBy = "invoice")
    private Set<Ticket> tickets = new LinkedHashSet<>();

}