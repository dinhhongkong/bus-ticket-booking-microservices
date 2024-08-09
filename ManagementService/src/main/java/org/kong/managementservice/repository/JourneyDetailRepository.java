package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Journey;
import org.kong.managementservice.entity.JourneyDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface JourneyDetailRepository extends JpaRepository<JourneyDetail, Integer> {
    @Transactional
    @Modifying
    @Query("delete from Journey_Detail j where j.journey.id = ?1")
    int deleteByJourneyId(int id);

}