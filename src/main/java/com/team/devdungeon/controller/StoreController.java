package com.team.devdungeon.controller;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.service.StoreService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Base64;

@RequiredArgsConstructor
@Controller
public class StoreController {

    private final StoreService storeService;

    @GetMapping("/store")
    public ModelAndView store() {
        ModelAndView mv = new ModelAndView("content/store");

        String remotePath = "/home/woori/ftp/files/" + "icon2.png";
//        String filePath = "/Users/yjm/Downloads/" + "icon1.png";

        try {
            JSch jsch = new JSch();

            Session session = jsch.getSession(IconController.FTP_USER, IconController.FTP_HOST, IconController.FTP_PORT);
            session.setPassword(IconController.FTP_PASSWORD);
            session.setConfig("StrictHostKeyChecking", "no");
            session.connect();

            ChannelSftp sftpChannel = (ChannelSftp) session.openChannel("sftp");
            sftpChannel.connect();

            // 원격 서버에서 이미지 파일 읽어오기
            InputStream inputStream = sftpChannel.get(remotePath);

            // Inputstream -> byte[] 변환
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inputStream.read(buffer)) > -1 ) {
                baos.write(buffer, 0, len);
            }
            baos.flush();
            byte[] imageData = baos.toByteArray();

            // byte[] -> Base64
            String imageDataString = Base64.getEncoder().encodeToString(imageData);

            mv.addObject("imageDataString", imageDataString);

            sftpChannel.exit();
            session.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mv;
    }

    @GetMapping("/payShoppingBag")
    public String payShoppingBag() {
        return "content/payShoppingBag";
    }
    @GetMapping("/giftShoppingBag")
    public String giftShoppingBag() {
        return "content/giftShoppingBag";
    }

    @GetMapping("/couponChoice")
    public String couponChoice() {
        return "content/couponChoice";
    }

}
