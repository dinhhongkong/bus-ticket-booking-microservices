package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Journey;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JourneyRepository extends JpaRepository<Journey, Integer> {
}