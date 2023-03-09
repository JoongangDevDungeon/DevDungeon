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
	
	private String namespace = "com.team.devdungeon.dao.CSJDAO.";
	
	public List<Map<String, Object>> boardList() {
		return sqlSession.selectList(namespace+"boardList");
	}

	public PageInfo<Map<String, Object>> pageList(Integer pageNo, int i) {
		PageHelper.startPage(pageNo,i);
		return PageInfo.of(sqlSession.selectList(namespace+"boardList"));
	}

	public PageInfo<Map<String, Object>> pageList(CSJshowDTO dto) {
		PageHelper.startPage(dto.getPageNo(),dto.getPageSize());
		return PageInfo.of(sqlSession.selectList(namespace+"boardList",dto));
	}

	public int write(Map<String, Object> writemap) {
		return sqlSession.insert(namespace+"boardWrite",writemap);
	}

	public Map<String, Object> detail(int bno) {
		return sqlSession.selectOne(namespace+"detail",bno);
	}

	public Map<String, Object> memberProfile(int member_no) {
		return sqlSession.selectOne(namespace+"memberProfile",member_no);
	}

	public List<Map<String, Object>> commentList(int bno) {
		return sqlSession.selectList(namespace+"commentList",bno);
	}

	public int likethis(int bno) {
		return sqlSession.update(namespace+"likethis",bno);
	}

	public int readthis(int bno) {
		return sqlSession.update(namespace+"readthis",bno);
	}

}
