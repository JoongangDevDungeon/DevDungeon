package com.team.devdungeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.service.HJHBoardService;
import com.team.devdungeon.util.PageNation;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HJHBoardController {
	
	private final HJHBoardService HJHboardService;
	
	@Autowired
	private PageNation pagingNation;
	
	@GetMapping("/HJHBoard")
	public ModelAndView HJHBoard(@RequestParam(value="pageNo", defaultValue = "1") int pageNo) {
		ModelAndView mv = new ModelAndView("HJHBoard");
		int startPage = (pageNo*10)-9;
		int totalCount = HJHboardService.boardCount();
		List<Integer> paging = pagingNation.paging(totalCount);
		Map<String, Object> pages = new HashMap<String, Object>();
		pages.put("startPage", startPage);
		List<Map<String, Object>> list = HJHboardService.boardList(pages);
		mv.addObject("paging",paging);
		mv.addObject("list",list);
		return mv;
	}
	
	@GetMapping("/search")
	public ModelAndView search(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("HJHBoard");

		return mv;
	}
}
