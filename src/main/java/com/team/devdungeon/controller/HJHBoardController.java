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
	
	@GetMapping("/HJHBoard")
	public ModelAndView HJHBoard(@RequestParam(value="pageNo", defaultValue = "1") int pageNo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("HJHBoard");
		Map<String, Object> pages = new HashMap<String, Object>();
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		int startPage = (pageNo*10)-10;
		int totalCount = HJHboardService.boardCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);
		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		List<Map<String, Object>> list = HJHboardService.boardList(pages);
		mv.addObject("pages",pages);
		mv.addObject("list",list);
		mv.addObject("pageNo", pageNo);
		return mv;
	}
	@GetMapping("/HJHBoardDetail")
	public ModelAndView boardDetail(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("HJHBoardDetail");
		String board_no = request.getParameter("board_no");
		Map<String, Object> boardDetail = HJHboardService.boardDetail(board_no);
		mv.addObject("boardDetail",boardDetail);
		System.out.println(boardDetail);
		return mv;
	}
	
}
