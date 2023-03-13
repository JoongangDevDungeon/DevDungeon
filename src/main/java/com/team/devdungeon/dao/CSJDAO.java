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

	public int commentWrite(Map<String, Object> comment) {
		return sqlSession.insert(namespace+"commentWrite",comment);
	}

	public int csjReplyWrite(Map<String, Object> comment) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"replyCommentWrite",comment);
	}

	public PageInfo<Map<String, Object>> faqList(CSJshowDTO dto) {
		PageHelper.startPage(dto.getPageNo(),dto.getPageSize());
		return PageInfo.of(sqlSession.selectList(namespace+"faqList",dto));
	}

	public void userDelete(int bno) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+"deleteByUser",bno);
	}

	public int updateBoard(Map<String, Object> updatemap) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"updateBoard",updatemap);
	}

	public void banBoard(Map<String, Object> banMap) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+"banBoard",banMap);
	}

	public void userCommentDelete(int cno) {
		// TODO Auto-generated method stub
		sqlSession.update(namespace+"commentDelete",cno);
	}

	public void banComment(Map<String, Object> banMap) {
		// TODO Auto-generated method stub
		sqlSession.insert(namespace+"banComment",banMap);
	}


}
