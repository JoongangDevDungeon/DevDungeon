package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dto.CSJshowDTO;

@Repository
public class CSJDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<Map<String, Object>> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("com.team.devdungeon.dao.CSJDAO.boardList");
	}

	public PageInfo<Map<String, Object>> pageList(Integer pageNo, int i) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNo,i);
		return PageInfo.of(sqlSession.selectList("com.team.devdungeon.dao.CSJDAO.boardList"));
	}

	public PageInfo<Map<String, Object>> pageList(CSJshowDTO dto) {
		// TODO Auto-generated method stub
		PageHelper.startPage(dto.getPageNo(),dto.getPageSize());
		return PageInfo.of(sqlSession.selectList("com.team.devdungeon.dao.CSJDAO.boardList",dto));
	}

	public int write(Map<String, Object> writemap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("com.team.devdungeon.dao.CSJDAO.boardWrite",writemap);
	}

	public Map<String, Object> detail(int bno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.team.devdungeon.dao.CSJDAO.detail",bno);
	}

	public Map<String, Object> memberProfile(int member_no) {
		return sqlSession.selectOne("com.team.devdungeon.dao.CSJDAO.memberProfile",member_no);
	}

}
