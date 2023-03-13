package com.team.devdungeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.AnswerDTO;
import com.team.devdungeon.dto.BoardDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.MemberDTO;
import com.team.devdungeon.dto.QuestionBoardDTO;
import com.team.devdungeon.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin")
	public String admin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println("확인");
		if(session.getAttribute("id") == null) {
			return "admin/adminLogin";
		}else {
			return "admin/admin";
		}
		
	}
	
	
	//로그인
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "admin/adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request) {
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setAdmin_id(request.getParameter("adminID"));
		adminDTO.setAdmin_pw(request.getParameter("adminPW"));
		
		AdminDTO result = adminService.adminLogin(adminDTO);
		
		if(result.getCount() == 1) {
			//세션 만들기
			HttpSession session = request.getSession();
			session.setAttribute("id", result.getAdmin_id());
			session.setAttribute("grade", result.getAdmin_grade());
			//System.out.println("id : " + session.getAttribute("id"));
			//System.out.println("grade : " + session.getAttribute("grade"));
			//System.out.println("로그인성공, 세션생성완료");
			
			return "redirect:/admin";
		} else {
			return "redirect:/adminLogin";
		}
		
	}
	
	//로그아웃
	@GetMapping("/adminLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin";
	}


	//사용자관리
	@GetMapping("/adminMember")

	public ModelAndView adminMember(HttpSession session) {
		ModelAndView mv = new ModelAndView("./admin/adminMember");
		List<MemberDTO> list = adminService.adminMember();
		mv.addObject("list", list);
	}

	public ModelAndView adminMember(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminMember");
		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.boardCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);


		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		
		List<Map<String, Object>> list = adminService.adminMember(pages);
		
		mv.addObject("pages",pages);
		mv.addObject("list",list);
		mv.addObject("pageNo", pageNo);
		

		return mv;
	}
	
	@PostMapping("/adminMember")
	public String adminMember(HttpServletRequest request) {
		
		String pageNo = request.getParameter("pageNo");
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setMember_grade(Integer.parseInt(request.getParameter("member_grade")));
		memberDTO.setMember_no(Integer.parseInt(request.getParameter("member_no")));
		
		adminService.memberUpdate(memberDTO);
		
		return "redirect:/adminMember?pageNo="+pageNo;
	}
	
	//게시글 관리
	@GetMapping("/adminBoard")
	public ModelAndView adminBoard(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminBoard");

		List<BoardDTO> list = adminService.adminBoard();
		mv.addObject("list", list);

		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.boardCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);


		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		
		List<Map<String, Object>> list = adminService.AdminBoard(pages);
		
		mv.addObject("pages",pages);
		mv.addObject("list",list);
		mv.addObject("pageNo", pageNo);

		return mv;
	}
	
	//게시글 삭제
	@PostMapping("/adminBoard")
	public String adminBoardDel(HttpServletRequest request) {


		request.getParameter("board_no");
		request.getParameter("status_no");
		String pageNo = request.getParameter("pageNo");
		//System.out.println("pageNo : "+pageNo);
		

		request.getParameter("board_no");
		request.getParameter("status_no");

		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		boardDTO.setStatus_no(Integer.parseInt(request.getParameter("status_no")));
		
		adminService.adminBoardDel(boardDTO);


		return "redirect:/adminBoard?pageNo="+pageNo;
	}
	
	
	
	//로그 데이터
	@GetMapping("/adminLog")
	public ModelAndView adminLog() {
		ModelAndView mv = new ModelAndView("./admin/adminLog");
		return mv;
	}
	
	//통계
	@GetMapping("/adminStatistics")
	public ModelAndView adminStatistics() {
		ModelAndView mv = new ModelAndView("./admin/adminStatistics");
		return mv;
	}
	
	
	//쿠폰발급
	@GetMapping("/adminCoupon")
	public ModelAndView adminCoupon() {
		ModelAndView mv = new ModelAndView("./admin/adminCoupon");
		List<CouponDTO> list = adminService.Coupon();
		mv.addObject("list", list);
		
		return mv;
	}
	@GetMapping("/adminCouponCreate")
	public String adminCouponCreate() {
		return "./admin/adminCouponCreate";
	}
	
	@PostMapping("/adminCouponCreate")
	public String adminCouponCreate(HttpServletRequest request) {
		CouponDTO couponDTO = new CouponDTO();
		couponDTO.setCoupon_name(request.getParameter("couponName"));
		couponDTO.setCoupon_content(request.getParameter("couponContent"));
		couponDTO.setEvent_no(Integer.parseInt(request.getParameter("coupon")));
		adminService.adminCouponCreate(couponDTO);
		return "redirect:/adminCoupon";
	}
	
	@ResponseBody
	@RequestMapping(value = "/adminCouponDel", method = { RequestMethod.POST })	
	public void test(@RequestParam("couponDel") int couponDel) {
	    adminService.adminCouponDel(couponDel);    
	    
	}
	
	//QnA
	@GetMapping("/adminQnA")
	public ModelAndView adminQnA() {
		ModelAndView mv = new ModelAndView("./admin/adminQnA");
		List<QuestionBoardDTO> qna = adminService.QnA();
		mv.addObject("qna", qna);
		
		return mv;
	} 
	@GetMapping("/adminAnswer")
	public ModelAndView adminAnswer(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminAnswer");
		int no = Integer.parseInt(request.getParameter("qnaNo"));
		
		List<QuestionBoardDTO> qna = adminService.Answer(no);
		mv.addObject("qna", qna);
		return mv;
	}
	@PostMapping("/adminAnswerComplete")
	public String adminAnswerComplete(HttpServletRequest request) {
		AnswerDTO answerDTO = new AnswerDTO();
		answerDTO.setAnswer_board_content(request.getParameter("answerContent"));
		answerDTO.setQuestion_board_no(Integer.parseInt(request.getParameter("questionNo")));
		answerDTO.setAnswer_board_title(request.getParameter("answerTitle"));
		
		adminService.adminAnswerComplete(answerDTO);
		int change = Integer.parseInt(request.getParameter("questionNo"));
		adminService.adminAnswerChange(change);
		
		return "redirect:/adminQnA";
	}
	
	
	//스토어
	@GetMapping("/adminStore")
	public ModelAndView adminStore() {
		ModelAndView mv = new ModelAndView("./admin/adminStore");
		return mv;
	}
	
	//이벤트
	@GetMapping("/adminEvent")
	public ModelAndView adminEvent() {
		ModelAndView mv = new ModelAndView("./admin/adminEvent");
		return mv;
	}

	
	//포인트
	@GetMapping("/adminPoint")
	public ModelAndView adminPoint() {
		ModelAndView mv = new ModelAndView("./admin/adminPoint");
		return mv;
	}
	
	
}