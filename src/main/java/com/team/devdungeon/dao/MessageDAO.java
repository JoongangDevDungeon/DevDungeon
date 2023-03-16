package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository
public class MessageDAO {

    private final SqlSession sqlSession;

	public void msgReceive(Map<String, Object> map) {
		 sqlSession.insert("mypage.msgReceive",map);
		
	}

	public int messageIdCheck(String member_name) {
		return sqlSession.selectOne("mypage.messageIdCheck",member_name);
	}

}
