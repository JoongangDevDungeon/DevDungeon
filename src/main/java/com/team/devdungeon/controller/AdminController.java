package com.team.devdungeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.AnswerDTO;
import com.team.devdungeon.dto.BoardDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.EventDTO;
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
		//System.out.println("확인");
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
			
			return "redirect:/admin";
		} else {
			return "redirect:/adminLogin?error="+ 0;
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
	public ModelAndView adminMember(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminMember");
		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.adminMemberCount(pages);
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

		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.boardCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);

		//System.out.println(startPage);


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
		
		String pageNo = request.getParameter("pageNo");

		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		boardDTO.setStatus_no(Integer.parseInt(request.getParameter("status_no")));
		
		adminService.adminBoardDel(boardDTO);


		return "redirect:/adminBoard?pageNo="+pageNo;
	}
	
	
	
	//로그 데이터
	@GetMapping("/adminLog")
	public ModelAndView adminLog(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminLog");
		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.adminLogCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);
		

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		
		List<Map<String, Object>> list = adminService.AdminLog(pages);
		
		mv.addObject("pages",pages);
		mv.addObject("pageNo", pageNo);
		mv.addObject("list",list);
		
		return mv;
	}
	
	//통계
	@GetMapping("/adminStatistics")
	public ModelAndView adminStatistics() {
		ModelAndView mv = new ModelAndView("./admin/adminStatistics");
		return mv;
	}
	
	
	//쿠폰발급(페이징 서치바 추가)
	@GetMapping("/adminCoupon")
	public ModelAndView adminCoupon(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminCoupon");
		
		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.adminCouponCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);
		
		//System.out.println(startPage);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		
		List<Map<String, Object>> list = adminService.adminCoupon(pages);
		
		mv.addObject("pages",pages);
		mv.addObject("list",list);
		mv.addObject("pageNo", pageNo);
		
		return mv;
	}
	@GetMapping("/adminCouponCreate")
	public String adminCouponCreate() {
		return "./admin/adminCouponCreate";
	}
	
	@PostMapping("/adminCouponCreate")
	public String adminCouponCreate(HttpServletRequest request) {
		CouponDTO couponDTO = new CouponDTO();
		
		String pageNo = request.getParameter("pageNo");
		
		couponDTO.setCoupon_name(request.getParameter("couponName"));
		couponDTO.setCoupon_content(request.getParameter("couponContent"));
		couponDTO.setEvent_no(Integer.parseInt(request.getParameter("coupon")));
		
		adminService.adminCouponCreate(couponDTO);
		return "redirect:/adminCoupon?pageNo="+pageNo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/adminCouponDel", method = { RequestMethod.POST })	
	public void test(@RequestParam("couponDel") int couponDel) {
	    adminService.adminCouponDel(couponDel);    
	    
	}
	
	//QnA
	@GetMapping("/adminQnA")
	public ModelAndView adminQnA(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminQnA");
		
		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.adminQnACount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);
		

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		
		
		List<Map<String, Object>> qna = adminService.adminQnA(pages);
		
		mv.addObject("qna", qna);
		mv.addObject("pages",pages);
		mv.addObject("pageNo", pageNo);
		
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
		
		String pageNo = request.getParameter("pageNo");
		
		answerDTO.setAnswer_board_content(request.getParameter("answerContent"));
		answerDTO.setQuestion_board_no(Integer.parseInt(request.getParameter("questionNo")));
		answerDTO.setAnswer_board_title(request.getParameter("answerTitle"));
		
		adminService.adminAnswerComplete(answerDTO);
		int change = Integer.parseInt(request.getParameter("questionNo"));
		adminService.adminAnswerChange(change);
		
		return "redirect:/adminQnA?pageNo="+pageNo;
	}
	
	
	//스토어
	@GetMapping("/adminStore")
	public ModelAndView adminStore(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminStore");
		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.adminStoreCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);
		

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		
		List<Map<String, Object>> list = adminService.AdminStore(pages);
		
		mv.addObject("pages",pages);
		mv.addObject("pageNo", pageNo);
		mv.addObject("list",list);
		
		return mv;
	}
	
	//스토어 삭제
  	@PostMapping("/adminStore")
  	public String adminStoreDel(HttpServletRequest request) {
  		
  		String pageNo = request.getParameter("pageNo");

//  		BoardDTO boardDTO = new BoardDTO();
//  		
//  		boardDTO.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
//  		boardDTO.setStatus_no(Integer.parseInt(request.getParameter("status_no")));
//  		
//  		adminService.adminBoardDel(boardDTO);


  		return "redirect:/adminBoard?pageNo="+pageNo;
  	}
	
	
	//이벤트
	@GetMapping("/adminEvent")
	public ModelAndView adminEvent(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminEvent");
		Map<String, Object> pages = new HashMap<String, Object>();
		
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		
		int startPage = (pageNo*10)-10;
		int totalCount = adminService.adminEventCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);
		

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		
		List<Map<String, Object>> list = adminService.AdminEvent(pages);
		
		mv.addObject("pages",pages);
		mv.addObject("pageNo", pageNo);

		mv.addObject("list",list);
		return mv;
	}
	
	@GetMapping("/adminEventWrite")
	public ModelAndView adminEventWrite() {
		ModelAndView mv = new ModelAndView("./admin/adminEventWrite");
		return mv;
	}
	
	@PostMapping("/adminEventWrite")
	public String adminEventWrite(HttpServletRequest request) {
		EventDTO eventDTO = new EventDTO();
		eventDTO.setEvent_content(request.getParameter("eventContent"));
		eventDTO.setEvent_title(request.getParameter("eventTitle"));
		eventDTO.setTag_no(Integer.parseInt(request.getParameter("eventTag")));
		
		adminService.adminEventWrite(eventDTO);
		
		return "redirect:/adminEvent";
	}
	
	//이벤트 삭제
  	@PostMapping("/adminEvent")
  	public String adminEventDel(HttpServletRequest request) {
  		
  		String pageNo = request.getParameter("pageNo");

  		EventDTO eventDTO = new EventDTO();
  		
  		eventDTO.setEvent_no(Integer.parseInt(request.getParameter("event_no")));
  		eventDTO.setStatus_no(Integer.parseInt(request.getParameter("status_no")));
  		
  		adminService.adminEventDel(eventDTO);


  		return "redirect:/adminEvent?pageNo="+pageNo;
  	}
	
	//포인트
	@GetMapping("/adminPoint")
	public ModelAndView adminPoint() {
		ModelAndView mv = new ModelAndView("./admin/adminPoint");
		
		return mv;
	}
	
	
}