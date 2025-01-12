package org.kong.chatbotservice.mcp;

import org.springframework.ai.chat.model.ToolContext;
import org.springframework.ai.mcp.client.McpSyncClient;
import org.springframework.ai.mcp.spec.McpSchema;
import org.springframework.ai.model.ModelOptionsUtils;
import org.springframework.ai.model.function.FunctionCallback;

import java.util.Map;

public class McpFunctionCallbackCustom implements FunctionCallback {

    private final McpSyncClient mcpClient;
    private final McpSchema.Tool tool;

    public McpFunctionCallbackCustom(McpSyncClient clientSession, McpSchema.Tool tool) {
        this.mcpClient = clientSession;
        this.tool = tool;
    }

    @Override
    public String getName() {
        return this.tool.name();
    }

    @Override
    public String getDescription() {
        return this.tool.description();
    }

    @Override
    public String getInputTypeSchema() {
        return ModelOptionsUtils.toJsonString(this.tool.inputSchema());
    }

    @Override
    public String call(String functionInput) {
        Map<String, Object> arguments = ModelOptionsUtils.jsonToMap(functionInput);
        System.out.println("-----------------CALL TOOL-----------------------");
        System.out.println("functionInput: " + functionInput);
        System.out.println("name: " +  this.getName() + "  arguments:" + arguments);
        McpSchema.CallToolResult response = this.mcpClient.callTool(new McpSchema.CallToolRequest(this.getName(), arguments));
        System.out.println("-----------------------------------------");
        System.out.println(response.content().toString());
        System.out.println("-----------------------------------------");
        return ModelOptionsUtils.toJsonString(response.content());
    }

    @Override
    public String call(String functionInput, ToolContext tooContext) {
        return this.call(functionInput);
    }
}
