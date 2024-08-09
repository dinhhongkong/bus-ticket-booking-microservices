package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface TripRepository extends JpaRepository<Trip, Integer> {
    @Query("select t from Trip t where t.journey.id = ?1")
    List<Trip> findByJourneyId(Integer id);

}