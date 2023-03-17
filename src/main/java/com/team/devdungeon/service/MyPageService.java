package com.team.devdungeon.service;

import com.team.devdungeon.dto.MyPageDTO;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

public interface MyPageService {
    int checkPassword(Map<String, Object> memberInfo);
    MyPageDTO profile(String memberId);
    int memberIntro(Map<String, Object> map, MultipartFile profile_img);
    List<Map<String, Object>> icons(String memberId);
    int updateIcon(int iconNo, HttpSession session);
    MyPageDTO userProfile(String memberId);
    int updateProfile(Map<String, Object> map, HttpSession session);
    List<Map<String, Object>> loginLog(String memberId);
}
