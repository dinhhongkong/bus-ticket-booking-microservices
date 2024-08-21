package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Driver;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface DriverRepository extends JpaRepository<Driver, Integer> {
    @Query("select d from Driver d where d.id not in " +
            "(select dd.driver.id from d.driverDetails dd where dd.trip.departureDay = ?1)")
    List<Driver> findByDriverAvailable(LocalDate departureDay);

}