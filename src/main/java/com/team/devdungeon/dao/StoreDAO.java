package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@RequiredArgsConstructor
@Repository
public class StoreDAO {

    private final SqlSession sqlSession;

    public List<Map<String, Object>> iconList() {
        return sqlSession.selectList("store.iconList");
    }
}
