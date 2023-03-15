package com.team.devdungeon.controller;

import com.team.devdungeon.dto.MyPageDTO;
import com.team.devdungeon.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@Controller
public class MyPageController {

    private final MyPageService myPageService;
    @GetMapping("/checkPassword")
    public ModelAndView checkPass(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("mypage/checkPassword");
        mv.addObject("error", request.getParameter("error"));
        return mv;
    }

    @PostMapping("/checkPassword")
    public String checkPass(HttpServletRequest request, HttpSession session) {
        ModelAndView mv = new ModelAndView();

        Map<String, Object> memberInfo = new HashMap<>();
        memberInfo.put("member_id", session.getAttribute("member_id"));
        memberInfo.put("member_pw", request.getParameter("member_pw"));

        int result = myPageService.checkPassword(memberInfo);
        if(result == 1) {
            return "redirect:/profile";
        } else {
            return "redirect:/checkPassword?error=password_fail";
        }
    }

    @GetMapping("/profile")
    public ModelAndView profile(HttpSession session) {
        ModelAndView mv = new ModelAndView("mypage/profile");
        MyPageDTO profile = myPageService.profile((String)session.getAttribute("member_id"));
        mv.addObject("profile", profile);
        return mv;
    }

    @PostMapping("/profile")
    public String profile(HttpSession session, @RequestParam Map<String, Object> map, MultipartFile profile_img) {
        map.put("member_id", (String)session.getAttribute("member_id"));
        int result = myPageService.memberIntro(map, profile_img);
        return "redirect:/profile";
    }

    @GetMapping("/profileEdit")
    public String profileEdit() {
        return "mypage/profileEdit";
    }

    @PostMapping("/profileEdit")
    public String profileEdit(@RequestParam Map<String, Objects> map) {
        System.out.println(map);
        return "mypage/profileEdit";
    }
    @GetMapping("/myPageChangePassword")
    public String myPageChangePass() {
        return "mypage/myPageChangePassword";
    }

    @GetMapping("/loginLog")
    public String loginLog() {
        return "mypage/loginLog";
    }
}
