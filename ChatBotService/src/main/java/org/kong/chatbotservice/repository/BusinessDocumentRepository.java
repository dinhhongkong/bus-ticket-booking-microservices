package org.kong.chatbotservice.repository;

import org.kong.chatbotservice.entity.BusinessDocument;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BusinessDocumentRepository extends JpaRepository<BusinessDocument, Integer> {
}