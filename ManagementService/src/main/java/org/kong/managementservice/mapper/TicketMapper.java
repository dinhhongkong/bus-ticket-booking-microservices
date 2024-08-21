package org.kong.managementservice.mapper;

import org.kong.managementservice.dto.TicketDto;
import org.kong.managementservice.entity.Ticket;
import org.kong.managementservice.entity.TicketDetail;
import org.mapstruct.*;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface TicketMapper {
    @Mapping(source = "invoiceStatus", target = "invoice.status")
    @Mapping(source = "paymentMethod", target = "invoice.paymentMethod")
    @Mapping(source = "invoiceCreationDate", target = "invoice.creationDate")
    @Mapping(source = "dropOff", target = "dropOffPoint.officeName")
    @Mapping(source = "pickup", target = "pickupPoint.officeName")
    Ticket toEntity(TicketDto ticketDto);

    @InheritInverseConfiguration(name = "toEntity")
    @Mapping(target = "ticketDetailSeatNames", expression = "java(ticketDetailsToTicketDetailSeatNames(ticket.getTicketDetails()))")
    TicketDto toDto(Ticket ticket);

    List<TicketDto> toDto(List<Ticket> ticket);

    @InheritConfiguration(name = "toEntity")
    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Ticket partialUpdate(TicketDto ticketDto, @MappingTarget Ticket ticket);

    default Set<String> ticketDetailsToTicketDetailSeatNames(Set<TicketDetail> ticketDetails) {
        return ticketDetails.stream().map(TicketDetail::getSeatName).collect(Collectors.toSet());
    }
}