package org.kong.managementservice.repository;

import org.kong.managementservice.entity.Bus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.time.LocalDate;
import java.util.List;

public interface BusRepository extends JpaRepository<Bus, Integer> {
    @Query("select b from Bus b where b.id not in " +
            "(select t.bus.id from Trip t where t.departureDay = ?1 and t.bus.status =?2)")
    List<Bus> findByBusesNotRunningOnDate(LocalDate departureDay, int status);

}