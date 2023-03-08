package com.team.devdungeon.controller;

import com.team.devdungeon.dto.TestDTO;
import com.team.devdungeon.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

    @Autowired
    private TestService testService;

    @GetMapping("/test")
    public ModelAndView test() {
        ModelAndView mv = new ModelAndView("index");
    	System.out.println("이그노어 홍준호 확인!");
    	System.out.println("push and check");
    	System.out.println("git ignore");
    	System.out.println("git ignore");	
    	int count = testService.boardCount();
        System.out.println("결과 : " + count);
        TestDTO dto = new TestDTO();
        dto.setCount(1234567);
        mv.addObject("dto", dto);
        return mv;
    }

    @GetMapping("/yjmtest")
    public String yjmtest() {
        return "index";
    }

    @GetMapping("/index")
    public String index() {
    	
    	return "index";
    }


    @GetMapping("/agree")
    public String agree() {

        return "agree";
    }

    @GetMapping("/signup")
    public String signup() {

        return "signup";
    }
}
