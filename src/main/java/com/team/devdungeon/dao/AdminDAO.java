package com.team.devdungeon.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO {

    @Autowired
    private SqlSession sqlSession;

    public int boardCount() {
        return sqlSession.selectOne("board.boardCount");
    }
}
