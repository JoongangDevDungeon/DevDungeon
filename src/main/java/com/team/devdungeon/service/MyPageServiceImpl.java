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
import java.util.List;
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

        InputStream inputStream = null;
        ByteArrayOutputStream baos = null;
        byte[] buffer = null;
        byte[] imageData = null;

        try {
            try {
                inputStream = channelSftp.get(remotePath + "/" + profile.getPfp_name() + "." + profile.getPfp_extension());

                baos = new ByteArrayOutputStream();
                buffer = new byte[1024];
                int len;
                while ((len = inputStream.read(buffer)) > -1 ) {
                    baos.write(buffer, 0, len);
                }
                baos.flush();
                imageData = baos.toByteArray();

                String profile_image = Base64.getEncoder().encodeToString(imageData);
                profile.setProfile_image(profile_image);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("프로필 이미지 로딩중 에러 발생");
            }

            try {
                inputStream = channelSftp.get(remotePath + "/" + profile.getEmo_img_name() + "." + profile.getEmo_img_extension());

                baos = new ByteArrayOutputStream();
                buffer = new byte[1024];
                int len;
                while ((len = inputStream.read(buffer)) > -1) {
                    baos.write(buffer, 0, len);
                }
                baos.flush();
                imageData = baos.toByteArray();

                String icon_image = Base64.getEncoder().encodeToString(imageData);
                profile.setIcon_image(icon_image);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("아이콘 이미지 로딩중 에러 발생");
            }
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
                    InputStream inputStream = new ByteArrayInputStream(profile_img.getBytes());
                    channelSftp.put(inputStream, remotePath + pfp_name + "." + pfp_extension);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            result = myPageDAO.memberIntro(map);
        }

        return result;
    }

    @Override
    public List<Map<String, Object>> icons(String memberId) {
        return myPageDAO.icons(memberId);
    }
}
