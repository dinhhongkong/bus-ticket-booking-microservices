package org.kong.paymentservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity(name = "Payment_Status")
@Table(name = "payment_status")
public class PaymentStatus {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "timestamps", nullable = false)
    private LocalDateTime timestamps;

    @NotNull
    @Column(name = "payment_status", nullable = false)
    private Byte paymentStatus;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "invoice_id")
    private Invoice invoice;

}