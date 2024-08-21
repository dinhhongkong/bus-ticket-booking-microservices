package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Price;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface PriceRepository extends JpaRepository<Price, Integer> {
    @Query("select p from Price p where p.price = ?1")
    Optional<Price> findByPrice(Double price);

}