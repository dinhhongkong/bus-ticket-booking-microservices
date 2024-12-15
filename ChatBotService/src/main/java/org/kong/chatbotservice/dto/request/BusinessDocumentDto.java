package org.kong.chatbotservice.dto.request;

import lombok.Value;
import org.kong.chatbotservice.entity.BusinessDocument;

import java.io.Serializable;

/**
 * DTO for {@link BusinessDocument}
 */
@Value
public class BusinessDocumentDto implements Serializable {
    Integer id;
    String title;
    String content;
    Integer employeeId;
}