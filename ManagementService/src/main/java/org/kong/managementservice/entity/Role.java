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
@Entity(name = "Role")
@Table(name = "role")
public class Role {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id", nullable = false)
    private Integer id;

    @Size(max = 10)
    @NotNull
    @Column(name = "role_name", nullable = false, length = 10)
    private String roleName;

    @OneToMany(mappedBy = "role")
    private Set<User> users = new LinkedHashSet<>();

}