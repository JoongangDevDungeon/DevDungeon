package com.team.devdungeon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.devdungeon.dao.SKPBoardDAO;

@Service
public class SKPBoardService {
	
	@Autowired
	private SKPBoardDAO SKPboardDAO;
	
}
