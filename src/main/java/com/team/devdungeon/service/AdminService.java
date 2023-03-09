package com.team.devdungeon.service;

import java.util.List;

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


	public List<BoardDTO> adminBoard() {
		return adminDAO.adminBoard();
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

<<<<<<< HEAD
	public void memberUpdate(MemberDTO memberDTO) {
		adminDAO.memberUpdate(memberDTO);
		
=======
	public void adminBoardDel(BoardDTO boardDTO) {
		adminDAO.adminBoardDel(boardDTO);
>>>>>>> df75487ed505a85cfe453e0d455528e25ab6f467
	}

	


}
