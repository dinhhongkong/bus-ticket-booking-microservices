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
@Entity(name = "Bus_Type")
@Table(name = "bus_type")
public class BusType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "type_id", nullable = false)
    private Integer id;

    @Size(max = 20)
    @NotNull
    @Column(name = "type_name", nullable = false, length = 20)
    private String typeName;

    @OneToMany(mappedBy = "type")
    private Set<Bus> buses = new LinkedHashSet<>();

}