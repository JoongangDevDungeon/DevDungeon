package com.team.devdungeon.controller;

import com.team.devdungeon.dto.PointDTO;
import com.team.devdungeon.dto.SignDTO;
import com.team.devdungeon.service.PointService;
import lombok.RequiredArgsConstructor;
import lombok.Singular;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@Controller
public class PointController {

    private final PointService pointService;

    @GetMapping("/level")
    public ModelAndView level() {
        ModelAndView level = new ModelAndView("content/level");
        List<Map<String, Objects>> list = pointService.levelList();
        level.addObject("list", list);

        return level;
    }

    @GetMapping("/sendPoint")
    public String sendPoint() {
        return "message/sendPoint";
    }

    @PostMapping("/name_check")
    @ResponseBody
    public String name_check(HttpServletRequest request) {
        PointDTO pointDTO = new PointDTO();
        pointDTO.setMember_name(request.getParameter("member_name"));
        PointDTO result = pointService.name_check(pointDTO);
        if (result.getCount() == 1){
            return "0";
        }else {
            return "1";
        }
    }

    @PostMapping("/send_point")
    @ResponseBody
    public int send_point(HttpServletRequest request, HttpSession session) {
        PointDTO pointDTO = new PointDTO();

        pointDTO.setSend_member_name((String) session.getAttribute("member_id"));
        pointDTO.setReceive_member_name(request.getParameter("member_name"));
        pointDTO.setPoint(Integer.parseInt(request.getParameter("point")));

        int result = pointService.send_point(pointDTO);
        System.err.println("성공의 1 : "+ result);

        return 1;
    }

}
