package org.kong.chatbotservice.controller;

import org.kong.chatbotservice.dto.request.CustomMessage;
import org.kong.chatbotservice.service.business.ChatBotService;
import org.springframework.ai.chat.model.ToolContext;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/ai")
public class ChatBotController {
    private final ChatBotService chatBotService;

    public ChatBotController(ChatBotService chatBotService) {
        this.chatBotService = chatBotService;
    }


    @PostMapping("/chat")
    public ResponseEntity<?> chat(@RequestBody List<CustomMessage> messages ) {
//        String response = chatBotService.chat(messages);
        String response = chatBotService.mcp(messages);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/chat/test")
    public ResponseEntity<?> chat(@RequestParam String messages ) {
        return ResponseEntity.ok(messages);
    }

}
