package org.kong.chatbotservice.controller;

import org.kong.chatbotservice.dto.request.BusinessDocumentDto;
import org.kong.chatbotservice.entity.ChatIntent;
import org.kong.chatbotservice.service.data.ChatIntentService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/ai/manage")
public class ChatIntentController {

    private final ChatIntentService chatIntentService;

    public ChatIntentController(ChatIntentService chatIntentService) {
        this.chatIntentService = chatIntentService;
    }

    @GetMapping("/chat-intents")
    public ResponseEntity<?> getChatIntent() {
        return ResponseEntity.ok(chatIntentService.chatIntents());
    }

    @PostMapping("/chat-intent")
    public ResponseEntity<?> createChatIntent(@RequestBody ChatIntent body) {
        return ResponseEntity.ok(chatIntentService.addChatIntent(body));
    }


    @PutMapping("/chat-intent")
    public ResponseEntity<?> updateChatIntent(@RequestParam int id,@RequestBody ChatIntent body) {
        return ResponseEntity.ok(chatIntentService.updateChatIntent(id,body));
    }


    @DeleteMapping("/chat-intent")
    public ResponseEntity<?> deleteDocument(@RequestParam int id) {
        chatIntentService.deleteChatIntent(id);
        return ResponseEntity.ok("ok");
    }

}
