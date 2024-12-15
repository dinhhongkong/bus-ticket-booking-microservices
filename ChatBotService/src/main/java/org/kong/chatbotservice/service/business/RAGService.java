package org.kong.chatbotservice.service.business;


import org.springframework.ai.document.Document;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RAGService {
    private final VectorStore vectorStore;

    public RAGService(VectorStore vectorStore) {
        this.vectorStore = vectorStore;
    }

    public void similarSearch(String message) {
        List<Document> documentList = vectorStore.similaritySearch(message);
        System.out.println(documentList);
    }
}
