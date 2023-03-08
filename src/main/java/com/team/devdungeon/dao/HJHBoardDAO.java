package com.team.devdungeon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface HJHBoardDAO {

	public int boardCount();

	public List<Map<String, Object>> boardList(Map<String, Object> pages);

	
}
