package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface NoticeDAO {

	public List<Map<String, Object>> noticeList(Map<String, Object> pages);

	public int noticeCount(Map<String, Object> pages);

	public void noticeWrite(Map<String, Object> map);

	public void noticeUpdate(Map<String, Object> map);

	public Map<String, Object> noticeDetail(String notice_no);

	public void noticeRead(String notice_no);

	public List<Map<String, Object>> detailComment(String notice_no);

	public void noticeComment(Map<String, Object> map);

	public int noticeLike(String notice_no);

	public String noticeLikeAjax(String notice_no);

	public void noticeSubComment(Map<String, Object> map);

	public int noticeDelete(String notice_no);

	public int noticeCommentDel(String comment_no);
	
	

}
