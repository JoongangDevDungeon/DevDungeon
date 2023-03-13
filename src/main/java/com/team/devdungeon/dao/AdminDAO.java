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

	//List<MemberDTO> adminMember();
	List<Map<String, Object>> adminMember(Map<String, Object> pages);

	List<CouponDTO> Coupon();

	void adminCouponCreate(CouponDTO couponDTO);

	List<QuestionBoardDTO> QnA();

	void memberUpdate(MemberDTO memberDTO);

	void adminBoardDel(BoardDTO boardDTO);


	int boardCount(Map<String, Object> pages);

	List<Map<String, Object>> adminBoard(Map<String, Object> pages);


	List<QuestionBoardDTO> Answer(int no);



}
