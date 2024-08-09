package org.kong.managementservice.repository;

import org.kong.managementservice.entity.DriverDetail;
import org.kong.managementservice.entity.DriverDetailId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DriverDetailRepository extends JpaRepository<DriverDetail, DriverDetailId> {
}