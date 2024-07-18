package org.kong.bookingservice.mapper;

import org.kong.bookingservice.dto.SeatDto;
import org.kong.bookingservice.entity.Seat;
import org.mapstruct.*;

import java.util.List;

@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE, componentModel = MappingConstants.ComponentModel.SPRING)
public interface SeatMapper {
    Seat toEntity(SeatDto seatDto);

    SeatDto toDto(Seat seat);

    List<SeatDto> toDto(List<Seat> seat);

    @BeanMapping(nullValuePropertyMappingStrategy = NullValuePropertyMappingStrategy.IGNORE)
    Seat partialUpdate(SeatDto seatDto, @MappingTarget Seat seat);
}