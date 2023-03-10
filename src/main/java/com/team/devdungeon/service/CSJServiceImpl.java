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
		System.out.println("wow");
		return 1;
	}

	@Override
	public List<Map<String, Object>> boardList() {
		return csjDAO.boardList();
	}

	@Override
	public PageInfo<Map<String, Object>> pageList(Integer pageNo, int i) {
		return csjDAO.pageList(pageNo,i);
	}

	@Override
	public PageInfo<Map<String, Object>> pageList(CSJshowDTO dto) {
		return csjDAO.pageList(dto);
	}

	@Override
	public int write(Map<String, Object> writemap) {
		return csjDAO.write(writemap);
	}

	@Override
	public Map<String, Object> detail(int bno) {
		return csjDAO.detail(bno);
	}

	@Override
	public Map<String, Object> memberProfile(int member_no) {
		return csjDAO.memberProfile(member_no);
	}

	@Override
	public List<Map<String, Object>> commentList(int bno) {
		return csjDAO.commentList(bno);
	}

	@Override
	public int likethis(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.likethis(bno);
	}

	@Override
	public int readthis(int bno) {
		// TODO Auto-generated method stub
		return csjDAO.readthis(bno);
	}

	@Override
	public int commentWrite(Map<String, Object> comment) {
		// TODO Auto-generated method stub
		return csjDAO.commentWrite(comment);
	}


}
