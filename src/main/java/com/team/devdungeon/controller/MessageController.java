package com.team.devdungeon.controller;

import com.team.devdungeon.service.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@RequiredArgsConstructor
@Controller
public class MessageController {

    private final MessageService messageService;

    @GetMapping("/message")
    public String message() {
        return "message/message";
    }

    @PostMapping("/message")
    public String message(HttpServletRequest request) {
        System.out.println( request.getParameter("member_name") );
        System.out.println( request.getParameter("msg_content") );

        return "redirect:/index";
    }

    @GetMapping("/sendPoint")
    public String sendPoint() {
        return "message/sendPoint";
    }

    @PostMapping("/sendPoint")
    public String sendPoint(HttpServletRequest request) {
        System.out.println( request.getParameter("member_name") );
        System.out.println( request.getParameter("send_point") );
        System.out.println( request.getParameter("msg_content") );

        return "message/sendPoint";
    }

}
