package com.javaweb.repository.custom.impl;

import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.javaweb.builder.BuildingSearchBuilder;



@Primary
@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding ON assignmentbuilding.buildingid = b.id ");
        }
    }

    public static void queryNormal(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for(Field it : fields) {
                it.setAccessible(true);
                String fieldName = it.getName();
                if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area")
                        && !fieldName.startsWith("rentPrice")) {
                    Object value = it.get(buildingSearchBuilder);
                    if (value != null) {
                        if(it.getType().getName().equals("java.lang.Long") || it.getType().getName().equals("java.lang.Integer") ) {
                            where.append(" AND b." + fieldName + " = " + value + " ");
                        }
                        else if(it.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            where.append(" AND assignmentbuilding.staffid = " + staffId);
        }
        Long rentAreaFrom = buildingSearchBuilder.getAreaFrom();
        Long rentAreaTo = buildingSearchBuilder.getAreaTo();
        if (rentAreaFrom != null || rentAreaTo != null) {
            where.append("AND EXISTS (SELECT r.value FROM rentarea r WHERE b.id = r.buildingid ");
            if(rentAreaFrom != null ) {
                where.append(" AND r.value >= " + rentAreaFrom);
            }
            if(rentAreaTo != null) {
                where.append(" AND r.value <= " + rentAreaTo);
            }
            where.append(") ");
        }
        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        if (rentPriceFrom != null || rentPriceTo != null) {
            if(rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom);
            }
            if(rentPriceTo != null) {
                where.append(" AND b.rentprice <= " + rentPriceTo);
            }
        }
//		java7
//		if (typecode != null && typecode.size() != 0) {
//			List<String> code = new ArrayList<>();
//			for(String i : typecode) {
//				code.add("'" + i + "'");
//			}
//			String res = String.join(", ", code);
//			where.append(" AND rt.code IN (" + res +")");
//		}
//		java8
        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            where.append(" AND(");
            String res = typeCode.stream().map(it -> "b.type LIKE '%" + it + "%'").collect(Collectors.joining(" OR "));
            where.append( res +")");
        }

    }
    @Override
    public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
        // Khởi tạo câu lệnh SQL
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        joinTable(buildingSearchBuilder, sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(buildingSearchBuilder, where);
        querySpecial(buildingSearchBuilder, where);
        where.append(" GROUP BY b.id ");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();


    }
}

