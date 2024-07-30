package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.Journey;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JourneyRepository extends JpaRepository<Journey, Integer> {
}