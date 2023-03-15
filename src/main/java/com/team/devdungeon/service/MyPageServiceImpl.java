package com.team.devdungeon.service;

import com.team.devdungeon.dao.MyPageDAO;
import com.team.devdungeon.dao.PointDAO;
import com.team.devdungeon.dto.MyPageDTO;
import lombok.RequiredArgsConstructor;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.Map;

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
        return myPageDAO.profile(memberId);
    }

    @Override
    public int introUpdate(Map<String, Object> map) {
        MultipartFile profile_img = (MultipartFile) map.get("profile_img");
        if(!profile_img.getOriginalFilename().equals("")) {
            String pfp_name = FilenameUtils.getBaseName(profile_img.getOriginalFilename());
            String pfp_extension = FilenameUtils.getExtension(profile_img.getOriginalFilename());
            map.put("pfp_name", pfp_name);
            map.put("pfp_extension", pfp_extension);
        }
        return myPageDAO.introUpdate(map);
    }
}
