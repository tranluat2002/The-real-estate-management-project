package com.javaweb.converter;


import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingListCoverter {
    @Autowired
    private ModelMapper modelMapper;


    public static String districtString(String district){
        if(district.equals("QUAN_1")){
            return "Quận 1";
        } else if (district.equals("QUAN_2")) {
            return "Quận 2";
        }
        else if (district.equals("QUAN_3")) {
            return "Quận 3";
        }
        else if (district.equals("QUAN_4")) {
            return "Quận 4";
        }
        return null;
    }

public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity item){
    BuildingSearchResponse buildingSearchResponse = modelMapper.map(item, BuildingSearchResponse.class);
    buildingSearchResponse.setAddress(item.getStreet() + "," + item.getWard() + ", " + districtString(item.getDistrict()));
    List<RentAreaEntity> rentAreaEntities = item.getRentAreaEntities();
    String rentAreaResult = rentAreaEntities.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(", "));
    buildingSearchResponse.setRentArea(rentAreaResult);
    return buildingSearchResponse;
}


}
