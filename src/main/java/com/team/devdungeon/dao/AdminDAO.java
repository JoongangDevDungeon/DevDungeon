package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

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

//	List<BoardDTO> adminBoard();

	List<CouponDTO> Coupon();

	void adminCouponCreate(CouponDTO couponDTO);

	List<QuestionBoardDTO> QnA();


	void memberUpdate(MemberDTO memberDTO);

	void adminBoardDel(BoardDTO boardDTO);

<<<<<<< HEAD
	int boardCount(Map<String, Object> pages);

	List<Map<String, Object>> adminBoard(Map<String, Object> pages);
=======

	List<QuestionBoardDTO> Answer(int no);

>>>>>>> d6f24def3d6fe4537a94a65b60278758da73e683

}
