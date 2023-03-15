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

    @GetMapping("/agree")/*약관 동의 1, 2, 3*/
    public String agree() {
        return "sign/agree";
    }

    @PostMapping("/agree")/*약관 동의 1, 2, 3*/
    public String agree(HttpServletRequest request, RedirectAttributes agree) {
        String agree1 = request.getParameter("agree1");
        String agree2 = request.getParameter("agree2");
        String agree3 = request.getParameter("agree3");

        if( (agree1 != null && agree1.equals("check")) && (agree2 != null && agree2.equals("check")) ) {
            agree.addAttribute("Service", agree1);
            agree.addAttribute("Privacy", agree2);
            agree.addAttribute("Email", agree3);
            return "redirect:/signup";
        }
        return "redirect:/agree";
    }

    @GetMapping("/signup")/*약관 동의 1, 2, 3*/
    public ModelAndView signup(@RequestParam("Service") String agree1, @RequestParam("Privacy") String agree2, @RequestParam(value = "Email", defaultValue = "none") String agree3) {
        ModelAndView agrees = new ModelAndView("sign/signup");
        agrees.addObject("agree1", agree1);
        agrees.addObject("agree2", agree2);
        agrees.addObject("agree3", agree3);
        return agrees;
    }
    @PostMapping("/checkid")/*아이디 중복 체크*/
    @ResponseBody
    public String checkid(HttpServletRequest request){
        SignDTO signDTO = new SignDTO();
        signDTO.setMember_id((request.getParameter("member_id")));
        SignDTO result = signService.checkid(signDTO);
        System.err.println("id 중복 체크"+result.getCount());
        if (result.getCount() == 0){
            return "0";/*중복 없음*/
        }else{
            return "1";/*중복 있음*/
        }
    }

    @PostMapping("/send_mail")/*인증 번호 전송하면서 임시 테이블에(id, email, code) 저장함*/
    @ResponseBody
    public  String Mail(HttpServletRequest request) throws EmailException {
        SignDTO signDTO = new SignDTO();
        String att_num = Email.att_num();/*인증번호 가져옴*/
        signDTO.setMember_email(request.getParameter("member_email"));
        signDTO.setMember_id(request.getParameter("member_id"));
        signDTO.setVerify_code(att_num);
        SignDTO result = signService.mail_code(signDTO);

        String user_mail = signDTO.getMember_email();
        String title = "가지 회원가입 인증번호 입니다.";
        String msg = "회원 가입 인증번호<br><div style='color:red'>"+att_num+"</div>";
        Email.Mail(user_mail,"",title, msg);

        return "";
    }

    @PostMapping("/check_mail_num")/*인증 번호가 동일한지 체크*/
    @ResponseBody
    public  String check_mail_num(HttpServletRequest request){
        SignDTO signDTO = new SignDTO();
        return "";
    }

    @PostMapping("/signup")/*최종 회원가입*/
    public String signup(HttpServletRequest request) {
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