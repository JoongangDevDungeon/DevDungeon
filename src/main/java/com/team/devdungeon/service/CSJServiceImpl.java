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

	@Override
	public int write(Map<String, Object> writemap) {
		// TODO Auto-generated method stub
		return csjDAO.write(writemap);
	}

	@Override
	public Map<String, Object> detail(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.detail(bno);
	}

	@Override
	public Map<String, Object> memberProfile(int member_no) {
		// TODO Auto-generated method stub
		System.out.println("서비스"+member_no);
		System.out.println("서비스"+csjDAO.memberProfile(member_no));
		return csjDAO.memberProfile(member_no);
	}


}
