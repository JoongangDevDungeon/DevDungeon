package com.team.devdungeon.dao;

import com.team.devdungeon.dto.LoginDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@RequiredArgsConstructor
@Repository
public class LoginDAO {

    private final SqlSession sqlSession;

    public LoginDTO login(LoginDTO loginInfo) {
        return sqlSession.selectOne("login", loginInfo);
    }
}
