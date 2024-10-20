package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingDTOCoverter {

    @Autowired
    private ModelMapper modelMapper;
    public BuildingDTO toBuildingDTO(BuildingEntity building){
        BuildingDTO buildingDTO = modelMapper.map(building, BuildingDTO.class);
        List<RentAreaEntity> rentAreaEntities = building.getRentAreaEntities();
        String rentAreaResult = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
        buildingDTO.setRentArea(rentAreaResult);
        return buildingDTO;
    }

}
