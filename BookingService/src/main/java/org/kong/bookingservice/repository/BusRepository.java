package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Bus;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusRepository extends JpaRepository<Bus, Integer> {

}