package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@RequiredArgsConstructor
@Repository
public class LoginDAO {

    private final SqlSession sqlSession;



}
