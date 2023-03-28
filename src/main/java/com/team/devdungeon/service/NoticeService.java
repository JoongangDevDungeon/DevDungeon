package com.team.devdungeon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.NoticeDAO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NoticeService {
	
	private final NoticeDAO noticeDAO;
	
	public int noticeCount(Map<String, Object> pages) {
		return noticeDAO.noticeCount(pages);
	}

	public List<Map<String, Object>> noticeList(Map<String, Object> pages) {
		return noticeDAO.noticeList(pages);
	}

	public void noticeWrite(Map<String, Object> map) {
		noticeDAO.noticeWrite(map);
	}

	public void noticeUpdate(Map<String, Object> map) {
		noticeDAO.noticeUpdate(map);
		
	}

	public Map<String, Object> noticeDetail(String notice_no) {
		return noticeDAO.noticeDetail(notice_no);
	}

	public void noticeRead(String notice_no) {
		noticeDAO.noticeRead(notice_no);
	}

	public List<Map<String, Object>> detailComment(String notice_no) {
		return noticeDAO.detailComment(notice_no);
	}

	public void noticeComment(Map<String, Object> map) {
		noticeDAO.noticeComment(map);
	}

	public int noticeLike(String notice_no) {
		return noticeDAO.noticeLike(notice_no);
	}

	public String noticeLikeAjax(String notice_no) {
		return noticeDAO.noticeLikeAjax(notice_no);
	}

	public void noticeSubComment(Map<String, Object> map) {
		noticeDAO.noticeSubComment(map);
	}

	public int noticeDelete(String notice_no) {
		return noticeDAO.noticeDelete(notice_no);
	}

	public int noticeCommentDel(String comment_no) {
		return noticeDAO.noticeCommentDel(comment_no);
	}

	public Map<String, Object> callNoticeFile(int notice_no) {
		// TODO Auto-generated method stub
		return noticeDAO.callNoticeFile(notice_no);
	}

	public List<Map<String, Object>> noticeFive() {
		return noticeDAO.noticeFive();
	}
	
	

}
