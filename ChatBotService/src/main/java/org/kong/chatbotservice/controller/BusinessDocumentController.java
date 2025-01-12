package org.kong.chatbotservice.controller;

import org.kong.chatbotservice.dto.request.BusinessDocumentDto;
import org.kong.chatbotservice.dto.request.CustomMessage;
import org.kong.chatbotservice.service.data.VectorDatabaseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ai/manage")
public class BusinessDocumentController {
    private final VectorDatabaseService vectorDatabaseService;

    public BusinessDocumentController(VectorDatabaseService vectorDatabaseService) {
        this.vectorDatabaseService = vectorDatabaseService;
    }

    @GetMapping("/documents")
    public ResponseEntity<?> getDocuments() {
        return ResponseEntity.ok(vectorDatabaseService.getDocuments());
    }

    @PostMapping("/document")
    public ResponseEntity<?> createDocument(@RequestBody BusinessDocumentDto body) {
        vectorDatabaseService.addDocument(body);
        return ResponseEntity.ok("success");
    }


    @DeleteMapping("/document")
    public ResponseEntity<?> deleteDocument(@RequestParam int id) {
        vectorDatabaseService.deleteDocument(id);
        return ResponseEntity.ok("success");
    }
}
