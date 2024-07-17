package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Price;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PriceRepository extends JpaRepository<Price, Integer> {
}