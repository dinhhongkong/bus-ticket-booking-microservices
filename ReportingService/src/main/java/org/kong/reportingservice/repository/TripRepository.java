package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TripRepository extends JpaRepository<Trip, Integer> {

}