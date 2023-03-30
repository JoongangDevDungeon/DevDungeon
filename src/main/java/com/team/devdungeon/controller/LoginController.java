package com.team.devdungeon.controller;

import com.team.devdungeon.dto.LoginDTO;
import com.team.devdungeon.dto.MyPageDTO;
import com.team.devdungeon.service.LoginService;
import com.team.devdungeon.service.MessageService;
import com.team.devdungeon.service.MyPageService;

import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class LoginController {

    private final LoginService loginService;
    private final MyPageService myPageService;
    private final MessageService messageService;

    @PostMapping("/login")
    @ResponseBody
    public String login(HttpServletRequest request) {
        LoginDTO loginInfo = new LoginDTO();
        loginInfo.setMember_id(request.getParameter("member_id"));
        loginInfo.setMember_pw(request.getParameter("member_pw"));

        loginInfo = loginService.login(loginInfo);
        JSONObject json = new JSONObject();

        if(loginInfo != null) {
            HttpSession session = request.getSession();
            session.setAttribute("member_id", loginInfo.getMember_id());
            session.setAttribute("member_name", loginInfo.getMember_name());
            int msgCnt = messageService.newMsgCnt(loginInfo.getMember_name());
            MyPageDTO profile = myPageService.profile((String)session.getAttribute("member_id"));
            System.out.println(msgCnt);
            json.put("msgCnt", msgCnt);
            json.put("member_name", loginInfo.getMember_name());
            json.put("member_level", profile.getMember_level());
            json.put("member_point", profile.getMember_point());
            return json.toString();
        } else {
            return json.toString();
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/index";
    }

    @ResponseBody
    @GetMapping("/loginPoint")
    public String loginPoint(HttpSession session){
        JSONObject json = new JSONObject();
        String member_name = (String)session.getAttribute("member_name");

        Map<String,Object> map =  myPageService.loginPoint(member_name);
        json.put("member_level",map.get("member_level"));
        json.put("member_point",map.get("member_point"));
        return json.toString();
    }

}
