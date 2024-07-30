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
@Entity(name = "Province")
@Table(name = "province")
public class Province {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "province_id", nullable = false)
    private Integer id;

    @Size(max = 50)
    @NotNull
    @Column(name = "province_name", nullable = false, length = 50)
    private String provinceName;

    @OneToMany(mappedBy = "province")
    private Set<Office> offices = new LinkedHashSet<>();

}