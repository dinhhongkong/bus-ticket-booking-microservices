package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Journey;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JourneyRepository extends JpaRepository<Journey, Integer> {

    @Override
    void deleteById(Integer integer);
}