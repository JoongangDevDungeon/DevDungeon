package com.team.devdungeon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.AdminDAO;
import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.MemberDTO;

@Service
public class AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	public AdminDTO adminLogin(AdminDTO adminDTO) {
		return adminDAO.adminLogin(adminDTO);
	}

	public List<MemberDTO> adminMember() {
		return adminDAO.adminMember();
	}

	public List<MemberDTO> adminBoard() {
		return adminDAO.adminBoard();
	}

}
