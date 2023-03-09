package com.team.devdungeon.controller;

import com.team.devdungeon.dto.TestDTO;
import com.team.devdungeon.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class TestController {

    @Autowired
    private TestService testService;

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @GetMapping("/agree")
    public String agree() {

        return "sign/agree";
    }

    @GetMapping("/signup")
    public String signup() {

        return "sign/signup";
    }

    @GetMapping("/accountInquiry")
    public String accountInquiry() {
        return "sign/accountInquiry";
    }

    @PostMapping("/accountInquiry")
    public String accountInquiry(HttpServletRequest request) {
        System.out.println("계정 찾기 이메일 입력 완료" + ", 입력한 이메일 : " + request.getParameter("member_email"));
        return "redirect:/index";
    }
}