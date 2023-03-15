package com.team.devdungeon.service;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.dao.IconDAO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Map;
import java.util.UUID;

import static com.team.devdungeon.util.SFTPFileUtil.*;

@RequiredArgsConstructor
@Service
public class IconServiceImpl implements IconService{

    private final IconDAO iconDAO;

    @Override
    public int iconApply(Map<String, Object> map, MultipartFile iconFile) {
        String emo_img_name = UUID.randomUUID().toString();
        String emo_img_extension = FilenameUtils.getExtension(iconFile.getOriginalFilename());
        long emo_img_size = iconFile.getSize();

        map.put("emo_img_name", emo_img_name);
        map.put("emo_img_extension", emo_img_extension);
        map.put("emo_img_size", emo_img_size);

        System.out.println(map);
//        try {
//            JSch jsch = new JSch();
//            Session session = jsch.getSession(FTP_USER, FTP_HOST, FTP_PORT);
//            session.setPassword(FTP_PASSWORD);
//            session.setConfig("StrictHostKeyChecking", "no");
//            session.connect();
//            ChannelSftp sftpChannel = (ChannelSftp) session.openChannel("sftp");
//            sftpChannel.connect();
//
//            InputStream inputStream = new ByteArrayInputStream(iconFile.getBytes());
//
//            sftpChannel.put(inputStream, remotePath + randomName + "." + extension);
//
//            sftpChannel.exit();
//            session.disconnect();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }

        return 1;
    }
}
