package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

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

	//로그인 로그아웃
	AdminDTO adminLogin(AdminDTO adminDTO);
	
	//메인 대쉬보드
	
	//사용자 관리
	List<Map<String, Object>> adminMember(Map<String, Object> pages);
	
	void memberUpdate(MemberDTO memberDTO);
	
	//게시글 관리
	List<Map<String, Object>> adminBoard(Map<String, Object> pages);
		
	void adminBoardDel(BoardDTO boardDTO);
	
	//로그 데이터
	List<Map<String, Object>> AdminLog(Map<String, Object> pages);
	
	//통계
	
	//쿠폰 관련
	List<Map<String, Object>> adminCoupon(Map<String, Object> pages);
	
	void adminCouponCreate(CouponDTO couponDTO);
	
	void adminCouponDel(int couponDel);
	
	//QnA
	List<Map<String, Object>> adminQnA(Map<String, Object> pages);
	
	List<QuestionBoardDTO> Answer(int no);
	
	void adminAnswerComplete(AnswerDTO answerDTO);
	
	void adminAnswerChange(int change);
		
	//스토어
	List<Map<String, Object>> AdminStore(Map<String, Object> pages);
	
	//이벤트
	List<Map<String, Object>> AdminEvent(Map<String, Object> pages);
	
	//포인트 정산
	List<Map<String, Object>> AdminPoint(Map<String, Object> pages);
	
	//페이징 서치바 관련
	int boardCount(Map<String, Object> pages);
	
	int adminMemberCount(Map<String, Object> pages);
	
	int adminCouponCount(Map<String, Object> pages);

	int adminQnACount(Map<String, Object> pages);

	int adminStoreCount(Map<String, Object> pages);

	int adminEventCount(Map<String, Object> pages);

	int adminPointCount(Map<String, Object> pages);

	int adminLogCount(Map<String, Object> pages);





	
	
	







}
