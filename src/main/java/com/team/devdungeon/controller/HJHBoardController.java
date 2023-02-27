package com.team.devdungeon.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.service.HJHBoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HJHBoardController {
	
	private final HJHBoardService HJHBoardservice;
	
	@GetMapping("/HJHBoard")
	public ModelAndView HJHBoard() {
		ModelAndView mv = new ModelAndView("HJHBoard");
		List<Map<String, Object>> list = HJHBoardservice.boardList();
		System.out.println(list);
		mv.addObject("list",list);
		
		return mv;
	}
}
