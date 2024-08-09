package org.kong.authservice.repository;

import org.kong.authservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {

    Optional<User> findByUsername(String username);

    @Query("select u from User u where u.employeesByUserId.employeeId = ?1")
    User findByEmployeeId(int customerId);

}
