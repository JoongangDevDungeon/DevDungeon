package com.team.devdungeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.service.HJHBoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HJHBoardController {
	
	private final HJHBoardService HJHboardService;
	
	@GetMapping("/HJHBoard")
	public ModelAndView board(@RequestParam(value="pageNo", defaultValue = "1") int pageNo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("board/HJHBoard");
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
		ModelAndView mv = new ModelAndView("board/HJHBoardDetail");
		String board_no = request.getParameter("board_no");
		System.out.println(board_no);
		Map<String, Object> boardDetail = HJHboardService.boardDetail(board_no);
		List<Map<String,Object>> detailComments = HJHboardService.detailComment(board_no);
		mv.addObject("boardDetail",boardDetail);
		mv.addObject("detailComments",detailComments);
		return mv;
	}
	
	@PostMapping("/HJHComment")
	public String comment(HttpServletRequest request) {
		String comment = request.getParameter("commentText");
		String board_no = request.getParameter("board_no");
//		System.out.println(comment);
		
		return "redirect:/HJHBoardDetail?board_no="+board_no;
	}
}
