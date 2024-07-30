package org.kong.reportingservice.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity(name = "Driver")
@Table(name = "driver")
public class Driver {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "driver_id", nullable = false)
    private Integer id;

    @Size(max = 50)
    @Column(name = "full_name", length = 50)
    private String fullName;

    @Size(max = 20)
    @Column(name = "cccd", length = 20)
    private String cccd;

    @Size(max = 20)
    @Column(name = "license", length = 20)
    private String license;

    @Size(max = 13)
    @Column(name = "phone_number", length = 13)
    private String phoneNumber;

    @Size(max = 50)
    @Column(name = "email", length = 50)
    private String email;

    @Size(max = 15)
    @Column(name = "gender", length = 15)
    private String gender;

    @Size(max = 200)
    @Column(name = "address", length = 200)
    private String address;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

}