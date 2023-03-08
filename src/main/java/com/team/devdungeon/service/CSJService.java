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
}
