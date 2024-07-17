package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TripRepository extends JpaRepository<Trip, Integer> {
}