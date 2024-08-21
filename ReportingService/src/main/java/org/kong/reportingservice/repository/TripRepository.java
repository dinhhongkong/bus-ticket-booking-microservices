package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TripRepository extends JpaRepository<Trip, Integer> {
    @Query("select count(t) from Trip t")
    int countTrip();


}