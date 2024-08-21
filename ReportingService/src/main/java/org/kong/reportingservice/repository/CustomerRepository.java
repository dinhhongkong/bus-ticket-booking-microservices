package org.kong.reportingservice.repository;

import org.kong.reportingservice.entity.Customer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CustomerRepository extends JpaRepository<Customer, Integer> {
    @Query("select count(c) from Customer c")
    int countCustomer();

}