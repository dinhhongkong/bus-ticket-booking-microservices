package org.kong.chatbotservice.config;

import com.fasterxml.jackson.databind.ObjectMapper;

import org.kong.chatbotservice.mcp.McpFunctionCallbackCustom;
import org.springframework.ai.chat.client.ChatClient;
import org.springframework.ai.mcp.client.McpClient;
import org.springframework.ai.mcp.client.McpSyncClient;
import org.springframework.ai.mcp.client.stdio.ServerParameters;
import org.springframework.ai.mcp.client.stdio.StdioServerTransport;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.Duration;
import java.util.List;

@Configuration
public class MCPConfig {
    @Bean
    public List<McpFunctionCallbackCustom> functionCallbacks(McpSyncClient mcpClient) {
        var callbacks = mcpClient.listTools(null)
                .tools()
                .stream()
                .map(tool -> new McpFunctionCallbackCustom(mcpClient, tool))
                .toList();
        return callbacks;
    }

    @Bean(destroyMethod = "close")
    public McpSyncClient mcpClient() {

        var stdioParams = ServerParameters.builder("node")
                .args("C:\\Users\\KongDinh\\Documents\\Project\\MCP\\mcp-server-mysql\\dist")
                .build();

        var mcpClient = McpClient.sync(new StdioServerTransport(stdioParams),
                Duration.ofSeconds(15), new ObjectMapper());

        var init = mcpClient.initialize();
        System.out.println("MCP Initialized: " + init);
        return mcpClient;

    }

    @Bean
    public ChatClient chatClient(ChatClient.Builder chatClientBuilder,
                                 List<McpFunctionCallbackCustom> functionCallbacks) {
        return chatClientBuilder
                .defaultFunctions(functionCallbacks.toArray(new McpFunctionCallbackCustom[0]))
                .build();
    }
}
