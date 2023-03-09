package com.team.devdungeon.controller;

import com.team.devdungeon.dto.LoginDTO;
import com.team.devdungeon.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class LoginController {

    private final LoginService loginService;

    @PostMapping("/login")
    public String login(HttpServletRequest request) {
        LoginDTO loginInfo = new LoginDTO();
        loginInfo.setMember_id(request.getParameter("member_id"));
        loginInfo.setMember_pw(request.getParameter("member_pw"));

        loginInfo = loginService.login(loginInfo);

        if(loginInfo != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member_id", loginInfo.getMember_id());
            session.setAttribute("member_name", loginInfo.getMember_name());
            return "redirect:/index";
        } else {
            return "redirect:/index?error=login_fail";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        if(session.getAttribute("member_id") != null) {
            session.removeAttribute("member_id");
            session.removeAttribute("member_name");
            session.setMaxInactiveInterval(0);
        }

        return "redirect:/index";
    }

}
