package com.team.devdungeon.controller;

import com.team.devdungeon.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@Controller
public class MyPageController {

    private final MyPageService myPageService;
    @GetMapping("/checkPassword")
    public String checkPass() {
        return "mypage/checkPassword";
    }

    @PostMapping("/checkPassword")
    public String checkPass(HttpServletRequest request) {
        System.out.println( request.getParameter("member_pw") );
        return "redirect:/profile";
    }

    @GetMapping("/profile")
    public String profile() {
        return "mypage/profile";
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
