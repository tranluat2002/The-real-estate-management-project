package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;




@Component
public class BuildingEntityCoverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingEntity toBuildingEntity (BuildingDTO buildingDTO){
            BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
            return  buildingEntity;
    }

}
