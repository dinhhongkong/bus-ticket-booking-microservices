package org.kong.managementservice.repository;

import org.kong.managementservice.entity.BusType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusTypeRepository extends JpaRepository<BusType, Integer> {
}