package com.team.devdungeon.controller;

import com.team.devdungeon.service.IconService;
import com.team.devdungeon.util.SFTPFileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

@RequiredArgsConstructor
@Controller
public class IconController {

    private final IconService iconService;
    private final SFTPFileUtil sftpFileUtil;

    @GetMapping("/iconApply")
    public ModelAndView iconApply(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView("content/iconApply");
        mv.addObject("apply", request.getParameter("apply"));
        return mv;
    }

    @PostMapping("/iconApply")
    public String iconApply(@RequestParam Map<String, Object> map, @RequestPart("icon_file") MultipartFile iconFile, HttpSession session) throws IOException {
        int result = iconService.iconApply(map, iconFile, session);
        if(result == 1) {
            return "redirect:/iconApply?apply=success";
        } else {
            return "redirect:/iconApply?apply=fail";
        }
    }

}
