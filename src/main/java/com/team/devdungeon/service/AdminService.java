package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.AdminDAO;
import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.AnswerDTO;
import com.team.devdungeon.dto.BoardDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.MemberDTO;
import com.team.devdungeon.dto.QuestionBoardDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	//로그인 로그아웃
	public AdminDTO adminLogin(AdminDTO adminDTO) {
		return adminDAO.adminLogin(adminDTO);
	}
	
	//메인 대쉬보드
	
	//사용자 관리
	public List<Map<String, Object>> adminMember(Map<String, Object> pages) {
		return adminDAO.adminMember(pages);
	}
	
	public void memberUpdate(MemberDTO memberDTO) {
		adminDAO.memberUpdate(memberDTO);
	}
	
	//게시글 관리
	public List<Map<String, Object>> AdminBoard(Map<String, Object> pages) {
		return adminDAO.adminBoard(pages);
	}
	
	public void adminBoardDel(BoardDTO boardDTO) {
		adminDAO.adminBoardDel(boardDTO);
	}
	
	//로그 데이터
	public List<Map<String, Object>> AdminLog(Map<String, Object> pages) {
		return adminDAO.AdminLog(pages);
	}
	
	//통계
	
	//쿠폰 관련
	public List<Map<String, Object>> adminCoupon(Map<String, Object> pages) {
		return adminDAO.adminCoupon(pages);
	}
	
	public void adminCouponCreate(CouponDTO couponDTO) {
		adminDAO.adminCouponCreate(couponDTO);
	}
	
	public void adminCouponDel(int couponDel) {
		adminDAO.adminCouponDel(couponDel);
	}
	
	//QnA
	public List<Map<String, Object>> adminQnA(Map<String, Object> pages) {
		return adminDAO.adminQnA(pages);
	}
	
	public List<QuestionBoardDTO> Answer(int no) {
		return adminDAO.Answer(no);
	}
	
	public void adminAnswerComplete(AnswerDTO answerDTO) {
		adminDAO.adminAnswerComplete(answerDTO);
	}
	
	public void adminAnswerChange(int change) {
		adminDAO.adminAnswerChange(change);
	}
	
	//스토어
	public List<Map<String, Object>> AdminStore(Map<String, Object> pages) {
		return adminDAO.AdminStore(pages);
	}
	
	//이벤트
	public List<Map<String, Object>> AdminEvent(Map<String, Object> pages) {
		return adminDAO.AdminEvent(pages);
	}
	
	//포인트 정산
	public List<Map<String, Object>> AdminPoint(Map<String, Object> pages) {
		return adminDAO.AdminPoint(pages);
	}
	
	//페이징 서치바 관련
	public int boardCount(Map<String, Object> pages) {
		return adminDAO.boardCount(pages);
	}

	public int adminMemberCount(Map<String, Object> pages) {
		return adminDAO.adminMemberCount(pages);
	}
	
	public int adminCouponCount(Map<String, Object> pages) {
		return adminDAO.adminCouponCount(pages);
	}

	public int adminQnACount(Map<String, Object> pages) {
		return adminDAO.adminQnACount(pages);
	}

	public int adminStoreCount(Map<String, Object> pages) {
		return adminDAO.adminStoreCount(pages);
	}

	public int adminEventCount(Map<String, Object> pages) {
		return adminDAO.adminEventCount(pages);
	}

	public int adminPointCount(Map<String, Object> pages) {
		return adminDAO.adminPointCount(pages);
	}

	public int adminLogCount(Map<String, Object> pages) {
		return adminDAO.adminLogCount(pages);
	}










		











	

	

}
