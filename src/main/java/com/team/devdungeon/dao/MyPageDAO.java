package com.team.devdungeon.dao;

import com.team.devdungeon.dto.MyPageDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

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

    public int memberIntro(Map<String, Object> map) {
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

    public int myIconListCount(String memberId) {
        return sqlSession.selectOne("mypage.myIconListCount", memberId);
    }

    public List<Map<String, Object>> icons(Map<String, Object> pages) {
        return sqlSession.selectList("mypage.icons", pages);
    }

    public int updateIcon(Map<String, Object> info) {
        return sqlSession.update("mypage.updateIcon", info);
    }

    public Integer selectUseIcon(String memberId) {
        return sqlSession.selectOne("mypage.selectUseIcon", memberId);
    }

    public int deleteIcon(Map<String, Object> info) {
        return sqlSession.delete("mypage.deleteIcon", info);
    }

    public MyPageDTO userProfile(String memberId) {
        return sqlSession.selectOne("mypage.userProfile", memberId);
    }

    public int updateProfile(Map<String, Object> map) {
        return sqlSession.update("mypage.updateProfile", map);
    }

    public List<Map<String, Object>> loginLog(String memberId) {
        return sqlSession.selectList("mypage.loginLog", memberId);
    }

    public int nowPassCheck(Map<String, Object> map) {
        System.out.println("변경 전 : " + map);
        return sqlSession.selectOne("mypage.nowPassCheck", map);
    }

    public int modifyPassword(Map<String, Object> info) {
        System.out.println("변경 후 : " + info);
        return sqlSession.update("mypage.modifyPassword", info);
    }

    public Map<String, Object> loginPoint(String memberName) {
        return sqlSession.selectOne("mypage.loginPoint",memberName);
    }

}
