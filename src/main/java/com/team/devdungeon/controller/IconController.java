package com.team.devdungeon.controller;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.service.IconService;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletContext;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import java.util.UUID;

@RequiredArgsConstructor
@Controller
public class IconController {
    public static final String FTP_USER = "woori";
    public static final String FTP_PASSWORD = "0326655522";
    public static final String FTP_HOST = "172.30.1.21";
    public static final int FTP_PORT = 22;
    public static final String remotePath = "/home/woori/ftp/files/";

    private final IconService iconService;
    private final ServletContext context;

    @GetMapping("/iconApply")
    public String iconApply() {
        return "content/iconApply";
    }

    @PostMapping("/iconApply")
    public String iconApply(@RequestParam Map<String, Object> map, MultipartHttpServletRequest fileReq) throws IOException {
        MultipartFile iconFile = fileReq.getFile("icon_file");
        String originalFileName = iconFile.getOriginalFilename(); // 원래 파일 이름
        String extension = FilenameUtils.getExtension(originalFileName); // 파일 확장자
        String savedFileName = UUID.randomUUID().toString() + "." + extension; // 저장될 파일 이름

        try {
            JSch jsch = new JSch();

            Session session = jsch.getSession(FTP_USER, FTP_HOST, FTP_PORT);
            session.setPassword(FTP_PASSWORD);
            session.setConfig("StrictHostKeyChecking", "no");
            session.connect();

            ChannelSftp sftpChannel = (ChannelSftp) session.openChannel("sftp");
            sftpChannel.connect();

            InputStream inputStream = new ByteArrayInputStream(iconFile.getBytes());

            sftpChannel.put(inputStream, remotePath);

            sftpChannel.exit();
            session.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";
    }

}
