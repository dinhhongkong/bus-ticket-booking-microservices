package org.kong.chatbotservice.service.business;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.kong.chatbotservice.config.PromptTemplate;
import org.kong.chatbotservice.dto.request.CustomMessage;
import org.kong.chatbotservice.service.data.SQLToVectorStore;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.chat.messages.AssistantMessage;
import org.springframework.ai.chat.messages.Message;
import org.springframework.ai.chat.messages.SystemMessage;
import org.springframework.ai.chat.messages.UserMessage;
import org.springframework.ai.chat.prompt.Prompt;
import org.springframework.ai.chat.prompt.SystemPromptTemplate;
import org.springframework.ai.document.Document;
import org.springframework.ai.mcp.client.McpClient;
import org.springframework.ai.mcp.client.McpSyncClient;
import org.springframework.ai.mcp.client.stdio.ServerParameters;
import org.springframework.ai.mcp.client.stdio.StdioServerTransport;
import org.springframework.ai.mcp.spring.McpFunctionCallback;
import org.springframework.ai.vectorstore.VectorStore;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.random.RandomGenerator;
import java.util.stream.Collectors;

@Service
public class ChatBotService {

    private final VectorStore vectorStore;
    private final ChatClient aiClient;

    private final SQLToVectorStore sqlToVectorStore;

    public ChatBotService(VectorStore vectorStore,
                          ChatClient aiClient,
                          SQLToVectorStore sqlToVectorStore) {
        this.vectorStore = vectorStore;
        this.aiClient = aiClient;
        this.sqlToVectorStore = sqlToVectorStore;

    }

    public String chat(List<CustomMessage> messages) {

        String query = messages.get(messages.size() - 1).getContent();

        var listOfSimilarDocumentsFromVectorDB = this.vectorStore.similaritySearch(query);

        var similarDocumentsFromSQL = sqlToVectorStore.similaritySearch(query);
        System.out.println(similarDocumentsFromSQL);

        var documents = listOfSimilarDocumentsFromVectorDB
                .stream()
                .map(Document::getContent)
                .collect(Collectors.joining(System.lineSeparator()));

        String information = similarDocumentsFromSQL
                .stream()
                .map(Document::getContent)
                .collect(Collectors.joining(System.lineSeparator()));

        List<Message> messageList = new ArrayList<>();

        var systemMessage = new SystemPromptTemplate(PromptTemplate.PROMPT_CUSTOMER_TEMPLATE)
                .createMessage(Map.of("documents", documents + information));

        System.out.println("systemMessage: " + systemMessage);

        messageList.add(systemMessage);

        for (CustomMessage customMessage : messages) {
            if (customMessage.getRole().equals("user")) {
                messageList.add(new UserMessage(customMessage.getContent()));
            }
            else if (customMessage.getRole().equals("assistant")) {
                messageList.add(new AssistantMessage(customMessage.getContent()));
            }
        }

        var prompt = new Prompt(messageList);
        var aiResponse = aiClient.prompt(prompt);
        return aiResponse.call().chatResponse().getResult().getOutput().getContent();
    }

    public String mcp(List<CustomMessage> messages) {
        String query = messages.get(messages.size() - 1).getContent();

        var listOfSimilarDocumentsFromVectorDB = this.vectorStore.similaritySearch(query);

        var documents = listOfSimilarDocumentsFromVectorDB
                .stream()
                .map(Document::getContent)
                .collect(Collectors.joining(System.lineSeparator()));


        List<Message> messageList = new ArrayList<>();
        var systemMessage = new SystemPromptTemplate(PromptTemplate.PROMPT_SUPER)
                .createMessage(Map.of("documents", documents ));
        messageList.add(systemMessage);
//        System.out.println("-----------------SYSTEM MESSAGES-------------------");
//        System.out.println(systemMessage);
//        System.out.println("-----------------SYSTEM MESSAGES-------------------");
        for (CustomMessage customMessage : messages) {
            if (customMessage.getRole().equals("user")) {
                messageList.add(new UserMessage(customMessage.getContent()));
            }
            else if (customMessage.getRole().equals("assistant")) {
                messageList.add(new AssistantMessage(customMessage.getContent()));
            }
        }
        var prompt = new Prompt(messageList);
        return aiClient.prompt(prompt)
                .call().content();
    }






}
