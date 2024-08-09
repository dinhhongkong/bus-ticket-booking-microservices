package org.kong.managementservice.service.impl;

import lombok.AllArgsConstructor;
import org.kong.managementservice.config.OfficeType;
import org.kong.managementservice.dto.JourneyDetailDto;
import org.kong.managementservice.dto.JourneyDto;
import org.kong.managementservice.entity.Journey;
import org.kong.managementservice.entity.JourneyDetail;
import org.kong.managementservice.entity.Office;
import org.kong.managementservice.exception.ResourceNotFoundException;
import org.kong.managementservice.mapper.JourneyDetailMapper;
import org.kong.managementservice.repository.JourneyDetailRepository;
import org.kong.managementservice.repository.JourneyRepository;
import org.kong.managementservice.repository.OfficeRepository;
import org.kong.managementservice.service.JourneyService;
import org.kong.managementservice.utils.LocalTimeUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;


@Service
@AllArgsConstructor
public class JourneyServiceImpl implements JourneyService {
    private JourneyRepository journeyRepository;
    private JourneyDetailRepository journeyDetailRepository;
    private OfficeRepository officeRepository;
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
                    transferOffice.add(journeyDetailMapper.toDto(journeyDetail));
                }
                else if (journeyDetail.getType() == OfficeType.STOP_STATION) {
                    stopStation.add(journeyDetailMapper.toDto(journeyDetail));
                }
            }
            JourneyDto journeyDto = new JourneyDto( id, departureTime, travelTime, status, departureOffice, destinationOffice, transferOffice, stopStation );
            journeyDtoList.add(journeyDto);

        }

        return journeyDtoList;
    }

    @Override
    public JourneyDto getJourneyById(int journeyId) {
        Journey journey = journeyRepository.findById(journeyId)
                .orElseThrow(()-> new ResourceNotFoundException("Not found journey with id " + journeyId));

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
                transferOffice.add(journeyDetailMapper.toDto(journeyDetail));
            }
            else if (journeyDetail.getType() == OfficeType.STOP_STATION) {
                stopStation.add(journeyDetailMapper.toDto(journeyDetail));
            }
        }
        JourneyDto journeyDto = new JourneyDto( id, departureTime, travelTime, status, departureOffice, destinationOffice, transferOffice, stopStation );
        return journeyDto;
    }

    @Override
    @Transactional
    public void addNewJourney(JourneyDto journeyDto) {
        Journey journey = new Journey();
        journey.setDepartureTime( journeyDto.getDepartureTime() );
        journey.setTravelTime( journeyDto.getTravelTime() );
        journey.setStatus( journeyDto.getStatus());
        journey = journeyRepository.save(journey);
//        Nơi khởi hành
        JourneyDetail departure = journeyDetailMapper.toEntity(journeyDto.getDepartureOffice());
        Office office = officeRepository.findById(journeyDto.getDepartureOffice().getOfficeId())
                .orElseThrow();
        departure.setJourney(journey);
        departure.setOffice(office);
        departure.setDeltaTime(LocalTime.MIN);
        departure.setType(OfficeType.DEPARTURE);
        journeyDetailRepository.save(departure);

//        Nơi ket thuc
        JourneyDetail destination = journeyDetailMapper.toEntity(journeyDto.getDestinationOffice());
        office = officeRepository.findById(journeyDto.getDestinationOffice().getOfficeId())
                .orElseThrow();
        destination.setJourney(journey);
        destination.setOffice(office);
        destination.setDeltaTime(LocalTimeUtils.plusStringAndLocalTime(journeyDto.getTravelTime(),journeyDto.getDepartureTime()));
        destination.setType(OfficeType.DESTINATION);
        journeyDetailRepository.save(destination);

//        tram trung chuyen
        if ( journeyDto.getTransferOffice()!=null) {
            for (JourneyDetailDto transferOffice: journeyDto.getTransferOffice()){
                office = officeRepository.findById(transferOffice.getOfficeId())
                        .orElseThrow(()-> new ResourceNotFoundException("Office not found"));
                JourneyDetail journeyDetail = journeyDetailMapper.toEntity(transferOffice);
                journeyDetail.setJourney(journey);
                journeyDetail.setOffice(office);
                journeyDetail.setDeltaTime(transferOffice.getDeltaTime());
                journeyDetail.setType(OfficeType.TRANSFER);
                System.out.println("log khi luu: " + journeyDetail);
                journeyDetailRepository.save(journeyDetail);
            }
        }


//        tram dung
        if (journeyDto.getStopStation() != null) {
            for (JourneyDetailDto stopStation: journeyDto.getStopStation()){
                office = officeRepository.findById(stopStation.getOfficeId())
                        .orElseThrow(()-> new ResourceNotFoundException("Office not found"));
                JourneyDetail journeyDetail = journeyDetailMapper.toEntity(stopStation);
                journeyDetail.setJourney(journey);
                journeyDetail.setOffice(office);
                journeyDetail.setDeltaTime(stopStation.getDeltaTime());
                journeyDetail.setType(OfficeType.STOP_STATION);
                journeyDetailRepository.save(journeyDetail);
            }
        }



    }

    @Override
    public void updateJourney(JourneyDto journey) {

    }

    @Override
    @Transactional
    public void deleteJourneyById(int id) {
        journeyDetailRepository.deleteByJourneyId(id);
        journeyRepository.deleteById(id);
    }
}
