package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dao.CSJDAO;
import com.team.devdungeon.dto.CSJshowDTO;

@Service
public class CSJServiceImpl implements CSJService {

	@Autowired
	private CSJDAO csjDAO;
	
	@Override
	public int wow() {
		// TODO Auto-generated method stub
		System.out.println("wow");
		return 1;
	}

	@Override
	public List<Map<String, Object>> boardList() {
		// TODO Auto-generated method stub
		return csjDAO.boardList();
	}

	@Override
	public PageInfo<Map<String, Object>> pageList(Integer pageNo, int i) {
		// TODO Auto-generated method stub
		return csjDAO.pageList(pageNo,i);
	}

	@Override
	public PageInfo<Map<String, Object>> pageList(CSJshowDTO dto) {
		// TODO Auto-generated method stub
		return csjDAO.pageList(dto);
	}


}
