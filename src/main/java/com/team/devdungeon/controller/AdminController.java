package com.team.devdungeon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


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
//		System.out.println(result.getAdmin_id());
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
	
	
	
	
}
