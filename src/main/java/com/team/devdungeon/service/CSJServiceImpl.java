package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dao.CSJDAO;
import com.team.devdungeon.dto.CSJshowDTO;

@Service
public class CSJServiceImpl implements CSJService {

	@Autowired
	private CSJDAO csjDAO;
	
	@Override
	public int wow() {
		System.out.println("wow");
		return 1;
	}

	@Override
	public List<Map<String, Object>> boardList() {
		return csjDAO.boardList();
	}

	@Override
	public PageInfo<Map<String, Object>> pageList(Integer pageNo, int i) {
		return csjDAO.pageList(pageNo,i);
	}

	@Override
	public PageInfo<Map<String, Object>> pageList(CSJshowDTO dto) {
		return csjDAO.pageList(dto);
	}

	@Override
	public int write(Map<String, Object> writemap) {
		return csjDAO.write(writemap);
	}

	@Override
	public Map<String, Object> detail(int bno) {
		return csjDAO.detail(bno);
	}

	@Override
	public Map<String, Object> memberProfile(int member_no) {
		return csjDAO.memberProfile(member_no);
	}

	@Override
	public List<Map<String, Object>> commentList(int bno) {
		return csjDAO.commentList(bno);
	}

	@Override
	public int likethis(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.likethis(bno);
	}

	@Override
	public int readthis(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.readthis(bno);
	}

	@Override
	public int commentWrite(Map<String, Object> comment) {
		// TODO Auto-generated method stub
		return csjDAO.commentWrite(comment);
	}

	@Override
	public int ReplyWrite(Map<String, Object> comment) {
		// TODO Auto-generated method stub
		return csjDAO.csjReplyWrite(comment);
	}

	@Override
	public PageInfo<Map<String, Object>> faqList(CSJshowDTO dto) {
		// TODO Auto-generated method stub
		return csjDAO.faqList(dto);
	}

	@Override
	public void userDelete(int bno) {
		// TODO Auto-generated method stub
		csjDAO.userDelete(bno);
	}

	@Override
	public int updateBoard(Map<String, Object> updatemap) {
		// TODO Auto-generated method stub
		return csjDAO.updateBoard(updatemap);
	}

	@Override
	public void banBoard(Map<String, Object> banMap) {
		// TODO Auto-generated method stub
		csjDAO.banBoard(banMap);
	}

	@Override
	public void userCommentDelete(int cno) {
		// TODO Auto-generated method stub
		csjDAO.userCommentDelete(cno);
	}

	@Override
	public void banComment(Map<String, Object> banMap) {
		// TODO Auto-generated method stub
		csjDAO.banComment(banMap);
	}

	@Override
	public PageInfo<Map<String, Object>> eventList(CSJshowDTO dto) {
		// TODO Auto-generated method stub
		return csjDAO.eventList(dto);
	}

	@Override
	public Map<String, Object> eventdetail(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.eventdetail(bno);
	}

	@Override
	public Map<String, Object> callBoardFile(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.callBoardFile(bno);
	}

	@Override
	public void putBoardFile(Map<String, Object> fileMap) {
		// TODO Auto-generated method stub
		csjDAO.putBoardFile(fileMap);
	}

	@Override
	public PageInfo<Map<String, Object>> qnaList(CSJshowDTO dto) {
		// TODO Auto-generated method stub
		return csjDAO.qnaList(dto);
	}

	@Override
	public int qnaWrite(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return csjDAO.qnaWrite(map);
	}

	@Override
	public Map<String, Object> callEventFile(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.callEventFile(bno);
	}

	@Override
	public int eventJoin(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return csjDAO.eventJoin(map);
	}

	@Override
	public void addPoint(Map<String, Object> map) {
		// TODO Auto-generated method stub
		csjDAO.addPoint(map);
	}

	@Override
	public List<Map<String, Object>> eventFive() {
		// TODO Auto-generated method stub
		return csjDAO.eventFive();
	}

	@Override
	public List<Map<String, Object>> boardFive(String string) {
		// TODO Auto-generated method stub
		return csjDAO.boardFive(string);
	}




}
