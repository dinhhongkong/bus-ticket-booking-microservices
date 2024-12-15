package org.kong.chatbotservice.repository;

import org.kong.chatbotservice.entity.ChatIntent;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ChatIntentRepository extends JpaRepository<ChatIntent, Integer> {
}