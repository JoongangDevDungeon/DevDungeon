package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dto.CSJshowDTO;

public interface CSJService {
	public int wow();

	public List<Map<String, Object>> boardList();

	public PageInfo<Map<String, Object>> pageList(Integer pageNo, int i);

	public PageInfo<Map<String, Object>> pageList(CSJshowDTO dto);

	public int write(Map<String, Object> writemap);

	public Map<String, Object> detail(int bno);

	public Map<String, Object> memberProfile(int member_no);

	public List<Map<String, Object>> commentList(int bno);

	public int likethis(int bno);

	public int readthis(int bno);

	public int commentWrite(Map<String, Object> comment);

	public int ReplyWrite(Map<String, Object> comment);

	public PageInfo<Map<String, Object>> faqList(CSJshowDTO dto);

	public void userDelete(int bno);

	public int updateBoard(Map<String, Object> updatemap);

	public void banBoard(Map<String, Object> banMap);

	public void userCommentDelete(int bno);

	public void banComment(Map<String, Object> banMap);

	public PageInfo<Map<String, Object>> eventList(CSJshowDTO dto);

	public Map<String, Object> eventdetail(int bno);

	public Map<String, Object> callBoardFile(int bno);

	public void putBoardFile(Map<String, Object> fileMap);

	public PageInfo<Map<String, Object>> qnaList(CSJshowDTO dto);

}
