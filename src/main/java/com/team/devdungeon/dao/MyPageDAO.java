package com.team.devdungeon.dao;

import com.team.devdungeon.dto.MyPageDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.Map;
import java.util.Optional;

@RequiredArgsConstructor
@Repository
public class MyPageDAO {

    private final SqlSession sqlSession;

    public int checkPassword(Map<String, Object> memberInfo) {
        return sqlSession.selectOne("mypage.checkPassword", memberInfo);
    }

    public MyPageDTO profile(String memberId) {
        return sqlSession.selectOne("mypage.profile", memberId);
    }
}
