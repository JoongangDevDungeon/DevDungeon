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

    @GetMapping("/test")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("index");
    	System.out.println("홍준호님");
    	int count = testService.boardCount();
        System.out.println("결과 : " + count);
        TestDTO dto = new TestDTO();
        dto.setCount(1234567);
        mv.addObject("dto", dto);
        return mv;
    }

    @PostMapping("/test")
    public String index(HttpServletRequest request) {
        return "index";
    }

}
