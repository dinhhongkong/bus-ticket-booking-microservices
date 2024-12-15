package org.kong.chatbotservice.repository;

import org.kong.chatbotservice.entity.BusinessDocument;
import org.kong.chatbotservice.entity.DocumentChunk;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface DocumentChunkRepository extends JpaRepository<DocumentChunk, Integer> {
    @Transactional
    int deleteByBusinessDocument_Id(int id);

}