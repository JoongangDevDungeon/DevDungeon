package com.team.devdungeon.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.team.devdungeon.service.SKPBoardService;


@Controller
public class SKPBoardController {
	
	@Autowired
	private SKPBoardService SKPboardService;
	
	@GetMapping("/SKPBoard")
	public String SKPBoard() {
		
		return "SKPBoard";
	}
	
	
}
