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
@Entity(name = "User")
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", nullable = false)
    private Integer id;

    @Size(max = 30)
    @Column(name = "username", nullable = false, length = 30)
    private String username;

    @Size(max = 100)
    @Column(name = "password", nullable = false, length = 100)
    private String password;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;

    @Column(name = "enable", nullable = false)
    private Boolean enable = false;

    @OneToOne(mappedBy = "user")
    private Driver driver;

    @OneToMany(mappedBy = "user")
    private Set<Invoice> invoices = new LinkedHashSet<>();

}