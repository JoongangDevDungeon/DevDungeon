package com.team.devdungeon.service;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.dao.IconDAO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
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
    public int iconApply(Map<String, Object> map, MultipartFile iconFile, HttpSession session) {
        String emo_img_name = UUID.randomUUID().toString();
        String emo_img_extension = FilenameUtils.getExtension(iconFile.getOriginalFilename());
        long emo_img_size = iconFile.getSize();

        map.put("emo_img_name", emo_img_name);
        map.put("emo_img_extension", emo_img_extension);
        map.put("emo_img_size", emo_img_size);
        map.put("member_id", session.getAttribute("member_id"));

        int result = iconDAO.iconApply(map);

        if(result == 1) {
            System.out.println("삽입한 데이터 : " + map);
            try {
                JSch jsch = new JSch();
                Session sftp = jsch.getSession(FTP_USER, FTP_HOST, FTP_PORT);
                sftp.setPassword(FTP_PASSWORD);
                sftp.setConfig("StrictHostKeyChecking", "no");
                sftp.connect();
                ChannelSftp sftpChannel = (ChannelSftp) sftp.openChannel("sftp");
                sftpChannel.connect();

                InputStream inputStream = new ByteArrayInputStream(iconFile.getBytes());

                sftpChannel.put(inputStream, remotePath + emo_img_name + "." + emo_img_extension);

                sftpChannel.exit();
                sftp.disconnect();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return result;
    }
}
