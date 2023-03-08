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
		int category = 1; //카테고리에 맞는 글만 불러오도록 쿼리 수정
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		CSJshowDTO dto = new CSJshowDTO();
		dto.setPageNo(pageNo);
		dto.setPageSize(pageSize);
		dto.setCategory(category);
		
		if(searchType != null && searchValue != null) {
			dto.setSearchType(searchType);
			dto.setSearchValue(searchValue);
		}
		
		PageInfo<Map<String,Object>> pageList = csjService.pageList(dto);
		
		
		mv.addObject("pageInfo",pageList);
		mv.addObject("searchType",searchType);
		mv.addObject("searchValue",searchValue);
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
		mv.setViewName("redirect:/csjboard");
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
		Map<String,Object> writemap = new HashMap<String, Object>();
		writemap.put("title", title);
		writemap.put("content", content);
		writemap.put("category", category);
		writemap.put("tag", tag);
		writemap.put("file", file);
		
//		int result = csjService.write(writemap);
		return mv;
	}
	
	@GetMapping("/csjDetail")
	public ModelAndView detail(@RequestParam(value="bno") int bno) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/CSJDetail");
		
		Map<String,Object> det = csjService.detail(bno);
		int member_no = (int) det.get("member_no");
		System.out.println(member_no);
		Map<String,Object> mem = csjService.memberProfile(member_no);
		mv.addObject("det",det);
		System.out.println(mem);
		mv.addObject("mem",mem);
		
		return mv;
	}
}