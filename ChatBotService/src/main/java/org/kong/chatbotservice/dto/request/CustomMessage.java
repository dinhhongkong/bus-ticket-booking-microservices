package org.kong.chatbotservice.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CustomMessage {
    private String id;
    private String content;
    private String createAt;
    private String role;
    private String message;
    private String updateAt;
}
