package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.JourneyDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JourneyDetailRepository extends JpaRepository<JourneyDetail, Integer> {
}