package com.team.devdungeon.service;

import com.team.devdungeon.dto.MyPageDTO;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

public interface MyPageService {
    int checkPassword(Map<String, Object> memberInfo);
    MyPageDTO profile(String memberId);
    int introUpdate(Map<String, Object> map, MultipartFile profile_img);
}
