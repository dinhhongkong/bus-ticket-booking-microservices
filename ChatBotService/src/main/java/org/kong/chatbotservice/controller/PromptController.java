package org.kong.chatbotservice.controller;

import org.kong.chatbotservice.config.PromptTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/ai/manage")
public class PromptController {

    @GetMapping("/prompt")
    public ResponseEntity<?> prompt() {

        return ResponseEntity.ok(PromptTemplate.PROMPT_CUSTOMER_TEMPLATE);
    }

    @GetMapping("/prompt-retrieval")
    public ResponseEntity<?> promptRetrieval() {
        return ResponseEntity.ok(PromptTemplate.PROMPT_RETRIEVAL);
    }



}
