package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.AdminDAO;
import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.BoardDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.MemberDTO;
import com.team.devdungeon.dto.QuestionBoardDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	
	public AdminDTO adminLogin(AdminDTO adminDTO) {
		return adminDAO.adminLogin(adminDTO);
	}

	public List<MemberDTO> adminMember() {
		return adminDAO.adminMember();
	}


	public List<CouponDTO> Coupon() {
		return adminDAO.Coupon();
	}

	public void adminCouponCreate(CouponDTO couponDTO) {
		adminDAO.adminCouponCreate(couponDTO);
	}

	public List<QuestionBoardDTO> QnA() {
		return adminDAO.QnA();
	}

	public void memberUpdate(MemberDTO memberDTO) {
		adminDAO.memberUpdate(memberDTO);

	}
		

	public void adminBoardDel(BoardDTO boardDTO) {
		adminDAO.adminBoardDel(boardDTO);

	}


	public int boardCount(Map<String, Object> pages) {
		return adminDAO.boardCount(pages);
	}

	public List<Map<String, Object>> AdminBoard(Map<String, Object> pages) {
		return adminDAO.adminBoard(pages);
	}

	public List<QuestionBoardDTO> Answer(int no) {
		return adminDAO.Answer(no);

	}

}
