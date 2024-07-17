package org.kong.bookingservice.repository;

import org.kong.bookingservice.entity.Office;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OfficeRepository extends JpaRepository<Office, Integer> {
}