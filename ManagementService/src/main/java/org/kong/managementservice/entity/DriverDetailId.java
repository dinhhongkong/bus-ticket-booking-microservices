package org.kong.managementservice.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Embeddable
public class DriverDetailId implements Serializable {
    private static final long serialVersionUID = -5850311010032638727L;
    @NotNull
    @Column(name = "driver_id", nullable = false)
    private Integer driverId;

    @NotNull
    @Column(name = "trip_id", nullable = false)
    private Integer tripId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        DriverDetailId entity = (DriverDetailId) o;
        return Objects.equals(this.driverId, entity.driverId) &&
                Objects.equals(this.tripId, entity.tripId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(driverId, tripId);
    }

}