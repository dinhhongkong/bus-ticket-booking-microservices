package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.config.OfficeType;
import org.kong.managementservice.dto.JourneyDetailDto;
import org.kong.managementservice.dto.JourneyDto;
import org.kong.managementservice.entity.Journey;
import org.kong.managementservice.entity.JourneyDetail;
import org.kong.managementservice.mapper.JourneyDetailMapper;
import org.kong.managementservice.repository.JourneyDetailRepository;
import org.kong.managementservice.repository.JourneyRepository;
import org.kong.managementservice.service.JourneyService;
import org.springframework.stereotype.Service;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


@Service
@AllArgsConstructor
public class JourneyServiceImpl implements JourneyService {
    private JourneyRepository journeyRepository;
    private JourneyDetailRepository journeyDetailRepository;
    private JourneyDetailMapper journeyDetailMapper;

    @Override
    public List<JourneyDto> getAllJourney() {
        List<Journey> journeyList = journeyRepository.findAll();
        List<JourneyDto> journeyDtoList = new ArrayList<>();
        for (Journey journey : journeyList) {

            Integer id = null;
            LocalTime departureTime = null;
            String travelTime = null;
            Integer status = null;
            JourneyDetailDto departureOffice = null;
            JourneyDetailDto destinationOffice = null;
            List<JourneyDetailDto> transferOffice = new ArrayList<>();
            List<JourneyDetailDto> stopStation = new ArrayList<>();

            id = journey.getId();
            departureTime = journey.getDepartureTime();
            travelTime = journey.getTravelTime();
            status = journey.getStatus();

            Set<JourneyDetail> journeyDetailSet = journey.getJourneyDetails();
            for (JourneyDetail journeyDetail: journeyDetailSet) {
                if(journeyDetail.getType() == OfficeType.DEPARTURE) {
                    departureOffice = journeyDetailMapper.toDto(journeyDetail);
                }
                else if (journeyDetail.getType() == OfficeType.DESTINATION) {
                    destinationOffice = journeyDetailMapper.toDto(journeyDetail);
                }
                else if (journeyDetail.getType() == OfficeType.TRANSFER) {
                    transferOffice.add(departureOffice);
                }
                else if (journeyDetail.getType() == OfficeType.STOP_STATION) {
                    transferOffice.add(departureOffice);
                }
            }
            JourneyDto journeyDto = new JourneyDto( id, departureTime, travelTime, status, departureOffice, destinationOffice, transferOffice, stopStation );
            journeyDtoList.add(journeyDto);

        }

        return journeyDtoList;
    }

    @Override
    public void addNewJourney(JourneyDto journey) {

    }

    @Override
    public void updateJourney(JourneyDto journey) {

    }

    @Override
    public void deleteJourneyById(int id) {

    }
}
