package com.team.devdungeon.service;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.controller.IconController;
import com.team.devdungeon.dao.MyPageDAO;
import com.team.devdungeon.dto.MyPageDTO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;
import java.util.Map;
import java.util.UUID;

import static com.team.devdungeon.util.SFTPFileUtil.*;

@RequiredArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService {

    private final MyPageDAO myPageDAO;

    @Override
    public int checkPassword(Map<String, Object> memberInfo) {
        return myPageDAO.checkPassword(memberInfo);
    }

    @Override
    public MyPageDTO profile(String memberId) {
        MyPageDTO profile = myPageDAO.profile(memberId);
        try {
            JSch jsch = new JSch();
            Session session = jsch.getSession(FTP_USER, FTP_HOST, FTP_PORT);
            session.setPassword(FTP_PASSWORD);
            session.setConfig("StrictHostKeyChecking", "no");
            session.connect();
            ChannelSftp sftpChannel = (ChannelSftp) session.openChannel("sftp");
            sftpChannel.connect();

            InputStream inputStream = sftpChannel.get(remotePath + "/" + profile.getPfp_name() + "." + profile.getPfp_extension());

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            byte[] buffer = new byte[1024];
            int len;
            while ((len = inputStream.read(buffer)) > -1 ) {
                baos.write(buffer, 0, len);
            }
            baos.flush();
            byte[] imageData = baos.toByteArray();

            String profile_image = Base64.getEncoder().encodeToString(imageData);
            profile.setProfile_image(profile_image);

            sftpChannel.exit();
            session.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return profile;
    }

    @Override
    public int memberIntro(@RequestParam Map<String, Object> map, MultipartFile profile_img) {
        int result = 0;

        if(!profile_img.getOriginalFilename().equals("")) {
            String pfp_name = UUID.randomUUID().toString();
            String pfp_extension = FilenameUtils.getExtension(profile_img.getOriginalFilename());
            long pfp_size = profile_img.getSize();

            map.put("pfp_name", pfp_name);
            map.put("pfp_extension", pfp_extension);
            map.put("pfp_size", pfp_size);

            result = myPageDAO.memberIntro(map);

            if(result == 1) {
                try {
                    JSch jsch = new JSch();

                    Session session = jsch.getSession(FTP_USER, FTP_HOST, FTP_PORT);
                    session.setPassword(FTP_PASSWORD);
                    session.setConfig("StrictHostKeyChecking", "no");
                    session.connect();
                    ChannelSftp sftpChannel = (ChannelSftp) session.openChannel("sftp");
                    sftpChannel.connect();

                    InputStream inputStream = new ByteArrayInputStream(profile_img.getBytes());
                    sftpChannel.put(inputStream, remotePath + pfp_name + "." + pfp_extension);

                    sftpChannel.exit();
                    session.disconnect();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            result = myPageDAO.memberIntro(map);
        }

        return result;
    }
}
