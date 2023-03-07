package com.team.devdungeon.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.devdungeon.dto.AdminDTO;

@Repository
@Mapper
public interface AdminDAO {

	AdminDTO adminLogin(AdminDTO adminDTO);
	

}
