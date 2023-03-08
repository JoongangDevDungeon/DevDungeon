package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.MemberDTO;

@Repository
@Mapper
public interface AdminDAO {

	AdminDTO adminLogin(AdminDTO adminDTO);

	List<MemberDTO> adminMember();

	List<MemberDTO> adminBoard();
	

}
