package org.kong.managementservice.repository;

import org.kong.managementservice.entity.DriverDetail;
import org.kong.managementservice.entity.DriverDetailId;
import org.kong.managementservice.entity.Trip;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface DriverDetailRepository extends JpaRepository<DriverDetail, DriverDetailId> {
    @Transactional
    @Modifying
    @Query("delete from Driver_Detail d where d.trip.id = ?1")
    int deleteByTripId(int tripId);

}