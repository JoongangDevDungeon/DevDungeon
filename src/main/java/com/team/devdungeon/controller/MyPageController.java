package com.team.devdungeon.controller;

import com.team.devdungeon.dto.MyPageDTO;
import com.team.devdungeon.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            return "redirect:/myPage";
        } else {
            return "redirect:/checkPassword?error=password_fail";
        }
    }

    @GetMapping("/myPage")
    public ModelAndView myPage(HttpSession session) {
        ModelAndView mv = new ModelAndView("mypage/myPage");
        List<Map<String, Object>> icons = myPageService.icons((String)session.getAttribute("member_id"));
        MyPageDTO profile = myPageService.profile((String)session.getAttribute("member_id"));
        mv.addObject("profile", profile);
        mv.addObject("icons", icons);
        return mv;
    }

    @PostMapping("/iconSelect")
    @ResponseBody
    public int iconSelect(@RequestParam int icon_no, HttpSession session) {
        return myPageService.updateIcon(icon_no, session);
    }

    @PostMapping("/profileImage")
    public String profileImageAndIntro(HttpSession session, @RequestParam Map<String, Object> map, MultipartFile profile_img) {
        map.put("member_id", (String)session.getAttribute("member_id"));
        int result = myPageService.memberIntro(map, profile_img);
        return "redirect:/myPage";
    }

    @GetMapping("/profile")
    public ModelAndView profile(HttpSession session) {
        ModelAndView mv = new ModelAndView("mypage/profile");
        MyPageDTO member_info =  myPageService.userProfile((String)session.getAttribute("member_id"));

        mv.addObject("member_info", member_info);
        mv.addObject("year", member_info.getMember_birth().getYear());
        mv.addObject("month", member_info.getMember_birth().getMonthValue());
        mv.addObject("day", member_info.getMember_birth().getDayOfMonth());
        return mv;
    }

    @PostMapping("/profile")
    @ResponseBody
    public int profile(@RequestParam Map<String, Object> map, HttpSession session) {
        return myPageService.updateProfile(map, session);
    }
    @GetMapping("/myPageChangePassword")
    public String myPageChangePass() {
        return "mypage/myPageChangePassword";
    }

    @GetMapping("/loginLog")
    public String loginLog(HttpSession session, Model model) {
        List<Map<String, Object>> loginLog = myPageService.loginLog((String)session.getAttribute("member_id"));
        model.addAttribute("logList", loginLog);
        return "mypage/loginLog";
    }

    @PostMapping("/nowPassCheck")
    @ResponseBody
    public int nowPassCheck(HttpSession session, @RequestParam Map<String, Object> map) {
        map.put("member_id", session.getAttribute("member_id"));
        return myPageService.nowPassCheck(map);
    }

    @PostMapping("/modifyPassword")
    @ResponseBody
    public int modifyPassword(@RequestParam Map<String, Object> info, HttpSession session) {
        if(session.getAttribute("member_id") != null) {
            info.put("member_id", (String)session.getAttribute("member_id"));
        }
        return myPageService.modifyPassword(info);
    }
}
