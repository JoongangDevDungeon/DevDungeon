package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
import java.util.Objects;

@RequiredArgsConstructor
@Repository
public class PointDAO {

    private final SqlSession sqlSession;

    public List<Map<String, Objects>> levelList() {

        return sqlSession.selectList("level.list");
    }
}
