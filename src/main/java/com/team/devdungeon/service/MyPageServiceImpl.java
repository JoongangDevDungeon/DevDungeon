package com.team.devdungeon.service;

import com.team.devdungeon.dao.MyPageDAO;
import com.team.devdungeon.dao.PointDAO;
import com.team.devdungeon.dto.MyPageDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
}
