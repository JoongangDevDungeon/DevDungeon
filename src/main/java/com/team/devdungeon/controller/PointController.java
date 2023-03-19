package com.team.devdungeon.controller;

import com.team.devdungeon.service.PointService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.activation.CommandMap;
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
}
