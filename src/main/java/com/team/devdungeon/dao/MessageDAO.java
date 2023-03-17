package com.team.devdungeon.dao;

import lombok.RequiredArgsConstructor;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dto.CSJshowDTO;

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

	public PageInfo<Map<String, Object>> msgList(CSJshowDTO dto) {
		PageHelper.startPage(dto.getPageNo(),dto.getPageSize());
		return PageInfo.of(sqlSession.selectList("mypage.msgList",dto));
	}

}
