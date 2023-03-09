package com.team.devdungeon.controller;

import com.team.devdungeon.service.PointService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class PointController {

    private final PointService pointService;

    @GetMapping("/level")
    public String level() {
        return "level";
    }

}
