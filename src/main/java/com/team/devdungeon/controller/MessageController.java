package com.team.devdungeon.controller;

import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dto.CSJshowDTO;
import com.team.devdungeon.service.MessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RequiredArgsConstructor
@Controller
public class MessageController {

    private final MessageService messageService;

    @GetMapping("/message")
    public ModelAndView message(HttpServletRequest request) {
    	ModelAndView mv = new ModelAndView("message/message");
    	System.out.println(request.getParameter("receiver"));
    	mv.addObject("receiver",request.getParameter("receiver"));
        return mv;
    }

    @PostMapping("/message")
    public String message(HttpServletRequest request, HttpSession session) {
    	System.out.println( session.getAttribute("member_name") );
        System.out.println( request.getParameter("member_name") );
        System.out.println( request.getParameter("msg_title") );
        System.out.println( request.getParameter("msg_content") );
        String post_member_no = (String) session.getAttribute("member_name");
        String get_member_no = request.getParameter("member_name");
        String message_title = request.getParameter("msg_title");
        String message_content = request.getParameter("msg_content");
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("post_member_no", post_member_no);
        map.put("get_member_no", get_member_no);
        map.put("message_title", message_title);
        map.put("message_content", message_content);
        
        messageService.msgReceive(map);
        
        return "redirect:/csjCloser";
    }
    @ResponseBody
    @PostMapping("/messageIdCheck")
    public String messageIdCheck(@RequestParam String member_name) {
    	System.out.println(member_name);
    	int result = messageService.messageIdCheck(member_name);
    	return result+"";
    }
    @GetMapping("/msgBox")
    public ModelAndView msgBox(@RequestParam(defaultValue = "1")int pageNo,HttpSession session) {
    	ModelAndView mv = new ModelAndView("message/messageBox");
    	String member_id = (String)session.getAttribute("member_id");
    	if(member_id != null) {
    		int pageSize = 10;
    		CSJshowDTO dto = new CSJshowDTO();
    		dto.setPageNo(pageNo);
    		dto.setPageSize(pageSize);
    		dto.setMember_id(member_id);
    		PageInfo<Map<String,Object>> msgPageInfo = messageService.msgList(dto);
    		System.out.println(msgPageInfo);
    		mv.addObject("pageInfo",msgPageInfo);
    		mv.addObject("list",msgPageInfo.getList());
    		
    		return mv;
    	}else {
    		
    		return mv;
    	}
    }



}
