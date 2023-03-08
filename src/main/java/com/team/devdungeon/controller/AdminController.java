package com.team.devdungeon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.service.AdminService;



@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/admin")
	public String admin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("id") == null) {
			return "adminLogin";
		}else {
			return "admin";			
		}
		
	}
	
	
	//로그인
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "adminLogin";
	}
	
	@PostMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request) {
		//System.out.println(request.getParameter("adminID"));
		//System.out.println(request.getParameter("adminPW"));
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setAdmin_id(request.getParameter("adminID"));
		adminDTO.setAdmin_pw(request.getParameter("adminPW"));
		
		AdminDTO result = adminService.adminLogin(adminDTO);
		//System.out.println(result.getAdmin_id());
//		System.out.println(result.getAdmin_pw());
//		System.out.println(result.getCount());
		
		if(result.getCount() == 1) {
			//세션 만들기
			HttpSession session = request.getSession();
			session.setAttribute("id", result.getAdmin_id());
			session.setAttribute("grade", result.getAdmin_grade());
			System.out.println("로그인성공, 세션생성완료");
			
			
			return "redirect:/admin";
		} else {
			return "redirect:/adminLogin";
		}
		
	}
	
	
	//사용자관리
	@GetMapping("/adminMember")
	public ModelAndView adminMember() {
		ModelAndView mv = new ModelAndView("./admin/adminMember");
		return mv;
	}
	
	//게시글 관리
	@GetMapping("/adminBoard")
	public ModelAndView adminBoard() {
		ModelAndView mv = new ModelAndView("./admin/adminBoard");
		return mv;
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
		return mv;
	}
	
	//QnA
	@GetMapping("/adminQnA")
	public ModelAndView adminQnA() {
		ModelAndView mv = new ModelAndView("./admin/adminQnA");
		return mv;
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
