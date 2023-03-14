package com.team.devdungeon.service;

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
	

}
