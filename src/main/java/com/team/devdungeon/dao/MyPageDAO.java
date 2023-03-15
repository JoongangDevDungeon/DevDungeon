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

    public int introUpdate(Map<String, Object> map) {
        int result = sqlSession.update("mypage.introUpdate", map);

        if (map.containsKey("pfp_name")) {
            int count = sqlSession.selectOne("mypage.pfpCount", map.get("member_id"));
            if(count == 0) {
                System.out.println("인서트");
                result = sqlSession.insert("mypage.pfpInsert", map);
            } else {
                System.out.println("업데이트");
                result = sqlSession.update("mypage.pfpUpdate", map);
            }
        }

        return result;
    }
}
