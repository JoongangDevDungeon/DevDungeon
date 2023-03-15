package com.team.devdungeon.service;

import com.team.devdungeon.dto.MyPageDTO;

import java.util.Map;

public interface MyPageService {
    int checkPassword(Map<String, Object> memberInfo);
    MyPageDTO profile(String memberId);
}
