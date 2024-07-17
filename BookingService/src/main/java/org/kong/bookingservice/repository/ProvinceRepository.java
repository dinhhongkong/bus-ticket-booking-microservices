package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Province;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProvinceRepository extends JpaRepository<Province, Integer> {
}