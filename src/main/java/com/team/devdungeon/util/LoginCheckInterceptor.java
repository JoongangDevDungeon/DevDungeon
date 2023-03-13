package com.team.devdungeon.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginCheckInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("id") == null) {
       		// 로그인 되지 않음
			System.out.println("[미인증 사용자 요청]");
			
			//로그인으로 redirect
			response.sendRedirect("/adminLogin");
			return false;
		}
        // 로그인 되어있을 떄
		return true;
	}
}
