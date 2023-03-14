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

	public int boardCount(Map<String, Object> pages) {
		return HJHboardDAO.boardCount(pages);
	}
	public List<Map<String, Object>> boardList(Map<String, Object> pages) {
		return HJHboardDAO.boardList(pages);
	}
	public Map<String, Object> boardDetail(String board_no) {
		return HJHboardDAO.boardDetail(board_no);
	}
	public List<Map<String, Object>> detailComment(String board_no) {
		return HJHboardDAO.detailComment(board_no);
	}
	public void boardComment(Map<String, Object> map) {
		HJHboardDAO.boardComment(map);
	}
	public void boardWrite(Map<String, Object> map) {
		HJHboardDAO.boardWrite(map);
	}
	public void boardRead(String board_no) {
		HJHboardDAO.boardRead(board_no);
	}
	public int boardLike(String board_no) {
		return HJHboardDAO.boardLike(board_no);
	}
	public void boardUpdate(Map<String, Object> map) {
		HJHboardDAO.boardUpdate(map);
	}
	public String boardLikeAjax(String board_no) {
		return HJHboardDAO.boardLikeAjax(board_no);
	}
	public int boardDelete(String board_no) {
		return HJHboardDAO.boardDelete(board_no);
	}
	public int boardCommentDel(String comment_no) {
		return HJHboardDAO.boardCommentDel(comment_no);
	}
	public void boardSubComment(Map<String, Object> map) {
		HJHboardDAO.boardSubComment(map);
		
	}
}
