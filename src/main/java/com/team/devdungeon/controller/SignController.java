package com.team.devdungeon.controller;

import com.team.devdungeon.dto.SignDTO;
import com.team.devdungeon.service.SignService;
import com.team.devdungeon.util.Email;
import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

@Controller
public class SignController {

    @Autowired
    private SignService signService;

    @GetMapping("/index")
    public ModelAndView index(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("index");

        if(request.getParameter("error") != null) {
            mv.addObject("error_msg", request.getParameter("error"));
        }

        return mv;
    }

    @GetMapping("/agree")
    public String agree() {
        return "sign/agree";
    }

    @PostMapping("/agree")
    public String agree(HttpServletRequest request, RedirectAttributes agree) {
        String agree1 = request.getParameter("agree1");
        String agree2 = request.getParameter("agree2");
        String agree3 = request.getParameter("agree3");


        if(agree3 != null && agree3.equals("check")) {
            System.out.println("선택 약관 동의");
        }
        if( (agree1 != null && agree1.equals("check")) && (agree2 != null && agree2.equals("check")) ) {

            agree.addAttribute("Service", agree1);
            agree.addAttribute("Privacy", agree2);
            agree.addAttribute("Email", agree3);
            return "redirect:/signup";
        }

        return "redirect:/agree";
    }


    @GetMapping("/signup")
    public ModelAndView signup(@RequestParam("Service") String agree1, @RequestParam("Privacy") String agree2, @RequestParam(value = "Email", defaultValue = "none") String agree3) {

      /*  System.out.println(agree1);*//*check 값 넘어옴*/
        ModelAndView agrees = new ModelAndView("sign/signup");

        agrees.addObject("agree1", agree1);
        agrees.addObject("agree2", agree2);
        agrees.addObject("agree3", agree3);


        return agrees;
    }

    @PostMapping("/send_mail")
    @ResponseBody
    public  String Mail(HttpServletRequest request) throws EmailException {
        SignDTO signDTO = new SignDTO();
        signDTO.setMember_email(request.getParameter("member_email"));

        System.err.println("자바에들어온 이메일"+signDTO.getMember_email());

       /* String title = "가지 회원가입 인증번호 입니다.";
        String msg = "123456";
        Email.simpleMail("kingdori902@naver.com","test",title, msg);*/
     /*   System.out.println("연결됨");*/

        return "";
    }



    @PostMapping("/signup")
    public String signup(HttpServletRequest request) {/*회원가입*/
        SignDTO signDTO = new SignDTO();

        signDTO.setAgree1(request.getParameter("agree1"));
        signDTO.setAgree2(request.getParameter("agree2"));
        signDTO.setAgree3(request.getParameter("agree3"));

        signDTO.setMember_id(request.getParameter("member_id"));
        signDTO.setMember_pw(request.getParameter("member_pw1"));
        signDTO.setMember_name(request.getParameter("member_name"));

        signDTO.setYear(Integer.parseInt(request.getParameter("year")));
        signDTO.setMonth(Integer.parseInt(request.getParameter("month")));
        signDTO.setDay(Integer.parseInt(request.getParameter("day")));

        signDTO.setMember_email(request.getParameter("member_email"));
        signDTO.setMember_tel(request.getParameter("member_tel"));
        signDTO.setVerify_code((request.getParameter("verify_code")));



        signService.signup(signDTO);

        return "redirect:/index";
    }
    @PostMapping("/checkid")/*아이디 체크*/
    @ResponseBody
    public String checkid(HttpServletRequest request){

        SignDTO signDTO = new SignDTO();
        signDTO.setMember_id((request.getParameter("member_id")));
        SignDTO result = signService.checkid(signDTO);
        if (result.getCount() == 0){
            return "0";/*중복 없음*/
        }else{
            return "1";/*중복 있음*/
        }
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

    @PostMapping("/changePassword")
    public String changePassword(HttpServletRequest request) {
        String member_pw1 = request.getParameter("member_pw1");
        String member_pw2 = request.getParameter("member_pw2");
        System.out.println("1 : " + member_pw1 + " , "  + "2 : " + member_pw2);
        return "redirect:/index";
    }
}