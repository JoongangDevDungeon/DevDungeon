package com.team.devdungeon.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dto.CSJshowDTO;
import com.team.devdungeon.service.CSJService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CSJcontroller {
	
	private final CSJService csjService;
	
	@GetMapping("/csjboard")
	public ModelAndView csjboard(@RequestParam(defaultValue = "1") Integer pageNo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("CSJBoard");
		
		int pageSize = 10;
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		CSJshowDTO dto = new CSJshowDTO();
		dto.setPageNo(pageNo);
		dto.setPageSize(pageSize);
		if(searchType != null && searchValue != null) {
			dto.setSearchType(searchType);
			dto.setSearchValue(searchValue);
		}
		PageInfo<Map<String,Object>> pageList = csjService.pageList(dto);
		
		
		mv.addObject("pageInfo",pageList);
		mv.addObject("list",pageList.getList());
		return mv;
	}
	
	@GetMapping("/csjWrite")
	public ModelAndView csjWrite() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("CSJWrite");
		return mv;
	}
	
	@PostMapping("/csjWrite")
	public ModelAndView csjWritePost(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("CSJBoard");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String category = request.getParameter("category");
		String tag = request.getParameter("tag");
		String file = request.getParameter("file");
		System.out.println(title);
		System.out.println(content);
		System.out.println(category);
		System.out.println(tag);
		System.out.println(file);
		return mv;
	}
}
