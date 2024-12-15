package org.kong.chatbotservice.mapper;

import org.kong.chatbotservice.dto.request.BusinessDocumentDto;
import org.kong.chatbotservice.entity.BusinessDocument;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface BusinessDocumentMapper {
    BusinessDocument toEntity(BusinessDocumentDto businessDocumentDto);

    BusinessDocumentDto toDto(BusinessDocument businessDocument);

    List<BusinessDocumentDto> toDto(List<BusinessDocument> businessDocument);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    BusinessDocument partialUpdate(BusinessDocumentDto businessDocumentDto, @MappingTarget BusinessDocument businessDocument);
}