package com.team.devdungeon.controller;

import com.team.devdungeon.service.IconService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@RequiredArgsConstructor
@Controller
public class IconController {

    private final IconService iconService;
    private final ServletContext context;

    @GetMapping("/iconApply")
    public String iconApply() {
        return "content/iconApply";
    }

    @PostMapping("/iconApply")
    public String iconApply(@RequestParam Map<String, Object> map, MultipartHttpServletRequest fileReq) {
        MultipartFile iconFile = fileReq.getFile("icon_file");

        String originalFileName = iconFile.getOriginalFilename(); // 원래 파일 이름
        String extension = FilenameUtils.getExtension(originalFileName); // 파일 확장자
        String savedFileName = UUID.randomUUID().toString() + "." + extension; // 저장될 파일 이름

        String realPath = context.getRealPath("resources/");
        String upFilePath = realPath + "upFile/";

        System.out.println("실제 저장 경로명 : " + realPath);
        System.out.println("저장 경로 및 파일 : " + upFilePath);

        System.out.println("파일명 : " + originalFileName);
        System.out.println("확장자 : " + extension);
        System.out.println("데이터베이스 저장명 : " + savedFileName);

        System.out.println(map);
        return "index";
    }

}
