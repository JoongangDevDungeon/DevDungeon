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

<<<<<<< HEAD

=======
>>>>>>> ab1835a000cff60527ce0e3bfe715f5c4acb0455
	void memberUpdate(MemberDTO memberDTO);

	void adminBoardDel(BoardDTO boardDTO);

<<<<<<< HEAD
	List<QuestionBoardDTO> Answer(int no);

	

	
	


=======
>>>>>>> ab1835a000cff60527ce0e3bfe715f5c4acb0455
}
