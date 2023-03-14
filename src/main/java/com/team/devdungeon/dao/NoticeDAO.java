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

}
