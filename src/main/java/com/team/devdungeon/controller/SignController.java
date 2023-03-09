package com.team.devdungeon.controller;

import com.team.devdungeon.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

@Controller
public class SignController {

    @Autowired
    private SignService signService;

    @GetMapping("/index")
    public String index() {
        return "index";
    }

    @PostMapping("/login")
    public String login(HttpServletRequest request) {
        System.out.println("ID : " + request.getParameter("member_id"));
        System.out.println("PW : " + request.getParameter("member_pw"));
        return "redirect:/index";
    }

    @GetMapping("/agree")
    public String agree() {
        return "sign/agree";
    }

    @PostMapping("/agree")
    public String agree(HttpServletRequest request) {
        String agree1 = request.getParameter("agree1");
        String agree2 = request.getParameter("agree2");
        String agree3 = request.getParameter("agree3");

        if( (agree1 != null && agree1.equals("check")) &&
                    (agree2 != null && agree2.equals("check")) ) {
            System.out.println("필수 약관 모두 동의");
        }

        if(agree3 != null && agree3.equals("check")) {
            System.out.println("선택 약관 동의");
        }

        return "redirect:/signup";
    }

    @GetMapping("/signup")
    public String signup() {
        return "sign/signup";
    }

    @PostMapping("/signup")
    public String signup(HttpServletRequest request) {
        System.out.println("회원가입 정보 입력 완료");

        String member_id = request.getParameter("member_id");
        String member_pw1 = request.getParameter("member_pw1");
        String member_pw2 = request.getParameter("member_pw2");
        String member_name = request.getParameter("member_name");

        int year = Integer.parseInt( request.getParameter("year") );
        int month = Integer.parseInt( request.getParameter("month") );
        int day = Integer.parseInt( request.getParameter("day") );

        String member_gender = request.getParameter("member_gender");
        String member_email = request.getParameter("member_email");
        String verify_code = request.getParameter("verify_code");
        String member_tel = request.getParameter("member_tel");

        System.out.println("아이디 : " + member_id);
        System.out.println("비밀번호1 : " + member_pw1);
        System.out.println("비밀번호2 : " + member_pw2);
        System.out.println("이름 : " + member_name);

        System.out.println("연도 : " + year);
        System.out.println("월 : " + month);
        System.out.println("일 : " + day);

        System.out.println("성별 : " + member_gender);
        System.out.println("이메일 : " + member_email);
        System.out.println("인증코드 : " + verify_code);
        System.out.println("전화번호 : " + member_tel);

        return "redirect:/index";
    }

    @GetMapping("/accountInquiry")
    public String accountInquiry() {
        return "sign/accountInquiry";
    }

    @PostMapping("/accountInquiry")
    public String accountInquiry(HttpServletRequest request) {
        // 이메일 전송 로직 작성하기

        System.out.println("계정 찾기 이메일 입력 완료" + ", 입력한 이메일 : " + request.getParameter("member_email"));
        return "redirect:/changePassword";
    }

    @GetMapping("/changePassword")
    public String changePassword() {
        return "sign/changePassword";
    }
}