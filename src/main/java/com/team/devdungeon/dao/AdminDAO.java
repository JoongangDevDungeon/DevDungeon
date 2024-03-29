package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.AnswerDTO;
import com.team.devdungeon.dto.BoardDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.EventDTO;
import com.team.devdungeon.dto.MemberDTO;
import com.team.devdungeon.dto.QuestionBoardDTO;

@Repository
@Mapper
public interface AdminDAO {

	//로그인 로그아웃
	AdminDTO adminLogin(AdminDTO adminDTO);
	
	//메인 대쉬보드
	List<Map<String, Object>> adminToday();
	
	List<Map<String, Object>> adminDate();
	
	List<Map<String, Object>> adminVisitor();
	
	//사용자 관리
	List<Map<String, Object>> adminMember(Map<String, Object> pages);
	
	void memberUpdate(MemberDTO memberDTO);
	
	//게시글 관리
	List<Map<String, Object>> adminBoard(Map<String, Object> pages);
		
	void adminBoardDel(BoardDTO boardDTO);
	
	List<Map<String, Object>> AdminBoardDetail(int boardNo);
	
	List<Map<String, Object>> BanBoard(Map<String, Object> pages);
	
	//로그 데이터
	List<Map<String, Object>> AdminLog(Map<String, Object> pages);
	
	//통계
	List<Map<String, Object>> LogDay();
	
	List<Map<String, Object>> LogTime();
	
	List<Map<String, Object>> LogMonth();
	
	//쿠폰
	List<Map<String, Object>> adminCoupon(Map<String, Object> pages);
	
	void adminCouponCreate(CouponDTO couponDTO);
	
	void adminCouponDel(int couponDel);
	
	List<Map<String, Object>> AdminCouponView();
	
	//QnA
	List<Map<String, Object>> adminQnA(Map<String, Object> pages);
	
	List<QuestionBoardDTO> Answer(int no);
	
	void adminAnswerComplete(AnswerDTO answerDTO);
	
	void adminAnswerChange(int change);
		
	//스토어
	List<Map<String, Object>> AdminStore(Map<String, Object> pages);
	
	void amdinStoreChange(Map<String, Object> change);
	
	//이벤트
	List<Map<String, Object>> AdminEvent(Map<String, Object> pages);
	
	void AdminEventDel(EventDTO eventDTO);
	
	void adminEventModal(EventDTO eventDTO);
	
	void adminEventWrite(EventDTO eventDTO);
	
	void puteventFile(Map<String, Object> fileMap);
	
	//페이징 서치바 관련
	int boardCount(Map<String, Object> pages);
	
	int adminMemberCount(Map<String, Object> pages);
	
	int adminCouponCount(Map<String, Object> pages);

	int adminQnACount(Map<String, Object> pages);

	int adminStoreCount(Map<String, Object> pages);

	int adminEventCount(Map<String, Object> pages);

	int adminLogCount(Map<String, Object> pages);

	int banBoardCount(Map<String, Object> pages);


}
