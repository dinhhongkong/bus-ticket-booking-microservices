package org.kong.chatbotservice.service.data;

import org.kong.chatbotservice.dto.request.BusinessDocumentDto;
import org.kong.chatbotservice.entity.BusinessDocument;
import org.kong.chatbotservice.entity.DocumentChunk;
import org.kong.chatbotservice.exception.ResourceNotFoundException;
import org.kong.chatbotservice.mapper.BusinessDocumentMapper;
import org.kong.chatbotservice.repository.BusinessDocumentRepository;
import org.kong.chatbotservice.repository.DocumentChunkRepository;
import org.springframework.ai.document.Document;
import org.springframework.ai.transformer.splitter.TokenTextSplitter;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class VectorDatabaseService {
    private final VectorStore vectorStore;
    private final BusinessDocumentRepository businessDocumentRepository;
    private final DocumentChunkRepository documentChunkRepository;
    private final BusinessDocumentMapper businessDocumentMapper;
    private final TokenTextSplitter tokenTextSplitter;

    public VectorDatabaseService(VectorStore vectorStore, BusinessDocumentRepository businessDocumentRepository, DocumentChunkRepository documentChunkRepository, BusinessDocumentMapper businessDocumentMapper, TokenTextSplitter tokenTextSplitter) {
        this.vectorStore = vectorStore;
        this.businessDocumentRepository = businessDocumentRepository;
        this.documentChunkRepository = documentChunkRepository;
        this.businessDocumentMapper = businessDocumentMapper;
        this.tokenTextSplitter = tokenTextSplitter;
    }

    public List<BusinessDocumentDto> getDocuments() {
        List<BusinessDocument> documents = businessDocumentRepository.findAll();
        return businessDocumentMapper.toDto(documents);
    }

    @Transactional
    public void addDocument(BusinessDocumentDto businessDocumentDto) {
        BusinessDocument document = businessDocumentMapper.toEntity(businessDocumentDto);
        Document doc = new Document(document.getTitle() + "\n" + document.getContent());

        List<Document> vectorChunks = tokenTextSplitter.split(doc);
        document = businessDocumentRepository.save(document);
        for (Document vectorChunk : vectorChunks) {
            DocumentChunk sqlChunk = new DocumentChunk();
            sqlChunk.setUuid(vectorChunk.getId());
            sqlChunk.setContent(vectorChunk.getContent());
            sqlChunk.setBusinessDocument(document);
            documentChunkRepository.save(sqlChunk);
        }
        vectorStore.add(vectorChunks);
    }

    @Transactional
    public void deleteDocument(int id) {
        BusinessDocument document = businessDocumentRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("Document not found"));
        List<String> idList = new ArrayList<>();
        for (DocumentChunk documentChunk : document.getDocumentChunks()) {
            idList.add(documentChunk.getUuid());
            documentChunkRepository.deleteByBusinessDocument_Id(id);
        }
        businessDocumentRepository.deleteById(id);
        vectorStore.delete(idList);
    }


}
