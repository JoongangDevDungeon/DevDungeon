package com.team.devdungeon.controller;

import com.team.devdungeon.service.IconService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@RequiredArgsConstructor
@Controller
public class IconController {

    private final IconService iconService;

    @GetMapping("/iconApply")
    public String iconApply() {
        return "content/iconApply";
    }

}
