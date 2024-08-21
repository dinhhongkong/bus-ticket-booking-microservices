package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Integer> {
    @Query("select count(u) from User u where u.enable = ?1 and u.role.roleName = ?2")
    int countByRoleName(Boolean enable, String roleName);

}