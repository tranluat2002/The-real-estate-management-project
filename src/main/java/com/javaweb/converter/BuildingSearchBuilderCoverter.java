package com.javaweb.converter;

import java.util.List;
import java.util.Map;

import com.javaweb.utils.MapUtils;
import org.springframework.stereotype.Component;

import com.javaweb.builder.BuildingSearchBuilder;

@Component
public class BuildingSearchBuilderCoverter {
    public BuildingSearchBuilder toBuildingSearchBuilder(Map<String, Object> params, List<String> typeCode) {
        BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder()
                .setName(MapUtils.getObject(params, "name", String.class))
                .setFloorarea(MapUtils.getObject(params, "floorArea", Long.class))
                .setWard(MapUtils.getObject(params, "ward", String.class))
                .setStreet(MapUtils.getObject(params, "street", String.class))
                .setDistrict(MapUtils.getObject(params, "district", String.class))
                .setLevel(MapUtils.getObject(params, "level", Long.class))
                .setDirection(MapUtils.getObject(params, "direction", String.class))
                .setNumberofbasement(MapUtils.getObject(params, "numberOfBasement", Long.class))
                .setTypeCode(typeCode)
                .setManagername(MapUtils.getObject(params, "managerName", String.class))
                .setManagerphone(MapUtils.getObject(params, "managerPhone", String.class))
                .setRentPriceFrom(MapUtils.getObject(params, "rentPriceFrom", Long.class))
                .setRentPriceTo(MapUtils.getObject(params, "rentPriceTo", Long.class))
                .setAreaFrom(MapUtils.getObject(params, "areaFrom", Long.class))
                .setAreaTo(MapUtils.getObject(params, "areaTo", Long.class))
                .setStaffId(MapUtils.getObject(params, "staffId", Long.class))
                .build();

        return buildingSearchBuilder;

    }
}