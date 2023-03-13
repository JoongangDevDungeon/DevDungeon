package com.team.devdungeon.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.AnswerDTO;
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


	void memberUpdate(MemberDTO memberDTO);

	void adminBoardDel(BoardDTO boardDTO);


	List<QuestionBoardDTO> Answer(int no);

	void adminCouponDel(int couponDel);

	void adminAnswerComplete(AnswerDTO answerDTO);

	void adminAnswerChange(int change);


}
