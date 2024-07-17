package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.BusType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusTypeRepository extends JpaRepository<BusType, Integer> {
}