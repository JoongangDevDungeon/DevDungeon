package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface HJHBoardDAO {

	public int boardCount(Map<String, Object> pages);

	public List<Map<String, Object>> boardList(Map<String, Object> pages);

	public Map<String, Object> boardDetail(String board_no);

	public List<Map<String, Object>> detailComment(String board_no);

	public void boardComment(Map<String, Object> map);

	public void boardWrite(Map<String, Object> map);

	public void boardRead(String board_no);

	public int boardLike(String board_no);

	public void boardUpdate(Map<String, Object> map);

	public String boardLikeAjax(String board_no);

	public int boardDelete(String board_no);

	public int boardCommentDel(String comment_no);

	public void boardSubComment(Map<String, Object> map);

}
