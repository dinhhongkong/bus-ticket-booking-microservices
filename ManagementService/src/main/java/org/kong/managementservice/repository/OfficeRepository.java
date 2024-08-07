package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Office;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OfficeRepository extends JpaRepository<Office, Integer> {
    @Query("select o from Office o where o.province.id = ?1")
    List<Office> findByProvinceId(Integer id);

}