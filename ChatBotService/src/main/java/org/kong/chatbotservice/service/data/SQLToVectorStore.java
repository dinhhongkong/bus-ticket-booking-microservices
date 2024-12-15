package org.kong.chatbotservice.service.data;

import org.kong.chatbotservice.entity.Journey;
import org.kong.chatbotservice.repository.JourneyRepository;
import org.springframework.ai.document.Document;

import org.springframework.ai.embedding.EmbeddingModel;
import org.springframework.ai.transformer.splitter.TokenTextSplitter;
import org.springframework.ai.vectorstore.SearchRequest;
import org.springframework.ai.vectorstore.SimpleVectorStore;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SQLToVectorStore {
    private final EmbeddingModel embeddingModel;
    private final JourneyRepository journeyRepository;
    private final TokenTextSplitter tokenTextSplitter;

    public SQLToVectorStore(EmbeddingModel embeddingModel, JourneyRepository journeyRepository, TokenTextSplitter tokenTextSplitter) {
        this.embeddingModel = embeddingModel;
        this.journeyRepository = journeyRepository;
        this.tokenTextSplitter = tokenTextSplitter;
    }

    public List<Document> similaritySearch(SearchRequest request) {
        VectorStore vectorStore = new SimpleVectorStore(this.embeddingModel);
        List<Journey> journeys = journeyRepository.findAll();
        List<Document> documents = new ArrayList<>();
        for (Journey journey : journeys) {
//            String content = "Lịch trình: " + journey.getSchedule() + "\n Chi tiết điểm đi: " + journey.getDetailsAddress();
            String content = "Lịch trình di chuyển lần lượt là: " + journey.getSchedule();
            Document document = new Document(content);
            documents.add(document);

        }
        vectorStore.add(documents);
        return vectorStore.similaritySearch(request);

    }

    public List<Document> similaritySearch(String query) {
        return this.similaritySearch(SearchRequest.query(query));
    }
}
