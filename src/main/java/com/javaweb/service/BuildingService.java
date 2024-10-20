package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;
import java.util.Map;

public interface BuildingService {
    ResponseDTO listStaffs(Long buildingId);
    public List<BuildingSearchResponse> getAllBuildings();

    List<BuildingSearchResponse> findAll(Map<String, Object> params, List<String> typecode);

    List<BuildingSearchResponse> checkFindAll(Map<String, Object> params, List<String> typecode);

    public void deleteById(List<Long> id);
    public BuildingDTO findById(Long id);

    public void updateOrAddBuilding(BuildingDTO buildingDTO);


}
