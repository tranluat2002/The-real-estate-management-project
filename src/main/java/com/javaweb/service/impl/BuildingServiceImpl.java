package com.javaweb.service.impl;

import com.javaweb.builder.BuildingSearchBuilder;
import com.javaweb.converter.BuildingDTOCoverter;
import com.javaweb.converter.BuildingEntityCoverter;
import com.javaweb.converter.BuildingListCoverter;
import com.javaweb.converter.BuildingSearchBuilderCoverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    BuildingListCoverter buildingListCoverter;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingSearchBuilderCoverter buildingSearchBuilderCoverter;

    @Autowired
    private BuildingDTOCoverter buildingDTOCoverter;

    @Autowired
    private BuildingEntityCoverter buildingEntityCoverter;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = building.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for (UserEntity it : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(it.getFullName());
            staffResponseDTO.setStaffId(it.getId());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("Checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;

    }

    @Override
    public List<BuildingSearchResponse> getAllBuildings() {
        List<BuildingSearchResponse> buildingSearchResponses = new ArrayList<>();
        List<BuildingEntity> buildingEntities= buildingRepository.findAll();
        for (BuildingEntity item : buildingEntities){
            buildingSearchResponses.add(buildingListCoverter.toBuildingSearchResponse(item));
        }
        return buildingSearchResponses;
    }

    @Override
    public List<BuildingSearchResponse> findAll(Map<String, Object> params, List<String> typecode) {
        BuildingSearchBuilder buildingSearchBuilder = buildingSearchBuilderCoverter.toBuildingSearchBuilder(params, typecode);
        List<BuildingSearchResponse> result = new ArrayList<BuildingSearchResponse>();
        List<BuildingEntity> entities = buildingRepository.findAll(buildingSearchBuilder);
        for (BuildingEntity item : entities) {
            result.add(buildingListCoverter.toBuildingSearchResponse(item));
        }
        return result;
    }

    @Override
    public List<BuildingSearchResponse> checkFindAll(Map<String, Object> params, List<String> typecode) {
        if (params.isEmpty() && (typecode == null || typecode.isEmpty())) {
            return getAllBuildings();
        }
        else {
            return findAll(params, typecode);
        }

    }
    @Transactional
    @Override
    public void deleteById(List<Long> id) {
        buildingRepository.deleteByIdIn(id);
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        return buildingDTOCoverter.toBuildingDTO(buildingEntity);
    }

    @Override
    public void updateOrAddBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingEntityCoverter.toBuildingEntity(buildingDTO);
        String[] values = buildingDTO.getRentArea().split(",");
        // Tạo danh sách RentAreaEntity và thêm vào building
        for (String val : values) {
            RentAreaEntity rentArea = new RentAreaEntity();
            rentArea.setValue(val);
            rentArea.setBuilding(buildingEntity); // Thiết lập liên kết với building
            buildingEntity.getRentAreaEntities().add(rentArea); // Thêm vào danh sách
        }
        buildingRepository.save(buildingEntity);

    }


}
