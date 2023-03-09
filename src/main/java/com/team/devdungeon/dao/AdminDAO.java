package com.team.devdungeon.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.BoardDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.MemberDTO;
import com.team.devdungeon.dto.QuestionBoardDTO;

@Repository
@Mapper
public interface AdminDAO {

	AdminDTO adminLogin(AdminDTO adminDTO);

	List<MemberDTO> adminMember();

	List<BoardDTO> adminBoard();

	List<CouponDTO> Coupon();

	void adminCouponCreate(CouponDTO couponDTO);

	List<QuestionBoardDTO> QnA();

	void adminBoardDel(BoardDTO boardDTO);

	

	
	


}
