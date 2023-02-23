package com.team.devdungeon.controller;

import com.team.devdungeon.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

    @Autowired
    private TestService testService;

    @GetMapping("/index")
    public String index() {
    	System.out.println("홍준호님");
    	System.out.println("push and check");
    	System.out.println("gitignore");
    	int count = testService.boardCount();
        System.out.println("결과 : " + count);
        return "index";
    }

}
