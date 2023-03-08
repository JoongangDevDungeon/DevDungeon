package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.HJHBoardDAO;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class HJHBoardService {
	
	private final HJHBoardDAO HJHboardDAO;

	public int boardCount() {
		return HJHboardDAO.boardCount();
	}

	public List<Map<String, Object>> boardList(Map<String, Object> pages) {
		return HJHboardDAO.boardList(pages);
	}


}
