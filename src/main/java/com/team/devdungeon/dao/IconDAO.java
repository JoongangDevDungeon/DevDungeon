package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.Map;

@RequiredArgsConstructor
@Repository
public class IconDAO {

    private final SqlSession sqlSession;

    public int iconApply(Map<String, Object> map) {
        return sqlSession.insert("icon.iconApply", map);
    }
}
