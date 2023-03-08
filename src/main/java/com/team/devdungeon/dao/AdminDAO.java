package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.MemberDTO;
import com.team.devdungeon.dto.QuestionBoardDTO;

@Repository
@Mapper
public interface AdminDAO {

	AdminDTO adminLogin(AdminDTO adminDTO);

	List<MemberDTO> adminMember();

	List<CouponDTO> Coupon();

	void adminCouponCreate(CouponDTO couponDTO);

	List<QuestionBoardDTO> QnA();

	
	

}
