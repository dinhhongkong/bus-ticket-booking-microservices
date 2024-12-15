package org.kong.chatbotservice.service.data;


import org.kong.chatbotservice.entity.ChatIntent;
import org.kong.chatbotservice.repository.ChatIntentRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatIntentService {
    private final ChatIntentRepository chatIntentRepository;

    public ChatIntentService(ChatIntentRepository chatIntentRepository) {
        this.chatIntentRepository = chatIntentRepository;
    }

    public List<ChatIntent> chatIntents() {
        return chatIntentRepository.findAll();
    }

    public ChatIntent addChatIntent(ChatIntent chatIntent) {
        return chatIntentRepository.save(chatIntent);
    }



    public ChatIntent updateChatIntent(int id, ChatIntent chatIntent) {
        ChatIntent intent = chatIntentRepository.findById(id).orElseThrow();
        intent.setTitle(chatIntent.getTitle());
        intent.setContent(chatIntent.getContent());
        intent.setType(chatIntent.getType());
//        intent.setEmployeeId(chatIntent.getEmployeeId());
        return chatIntentRepository.save(intent);
    }
    public void deleteChatIntent(int id) {
        ChatIntent intent = chatIntentRepository.findById(id).orElseThrow();
        chatIntentRepository.deleteById(id);
    }
}
