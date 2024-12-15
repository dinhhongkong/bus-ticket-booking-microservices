package org.kong.chatbotservice.repository;

import org.kong.chatbotservice.entity.Journey;
import org.springframework.data.jpa.repository.JpaRepository;

public interface JourneyRepository extends JpaRepository<Journey, Integer> {
}