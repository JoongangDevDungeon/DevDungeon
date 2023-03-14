package com.team.devdungeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.team.devdungeon.dto.CSJshowDTO;
import com.team.devdungeon.service.CSJService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class EventController {

	private final CSJService csjService;

	private final ServletContext context;
	
	@GetMapping("/eventboard")
	public ModelAndView csjboard(@RequestParam(defaultValue = "1") Integer pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/eventBoard");

		int pageSize = 6;
		int category = 1; // 카테고리에 맞는 글만 불러오도록 쿼리 수정
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		CSJshowDTO dto = new CSJshowDTO();
		dto.setPageNo(pageNo);
		dto.setPageSize(pageSize);
		dto.setCategory(category);

		if (searchType != null && searchValue != null) {
			dto.setSearchType(searchType);
			dto.setSearchValue(searchValue);
		}

		PageInfo<Map<String, Object>> pageList = csjService.eventList(dto);

		mv.addObject("pageNo", pageNo);
		mv.addObject("pageInfo", pageList);
		mv.addObject("searchType", searchType);
		mv.addObject("searchValue", searchValue);
		mv.addObject("list", pageList.getList());
		System.out.println(pageList);
		return mv;
	}

	@GetMapping("/eventDetail")
	public ModelAndView detail(@RequestParam(value = "bno") int bno) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/eventDetail");

		Map<String, Object> det = csjService.eventdetail(bno);
		if(det==null) {
			mv.setViewName("redirect:/eventboard");
			return mv;
		}
		List<Map<String, Object>> comment = csjService.commentList(bno);

		mv.addObject("det", det);
		mv.addObject("comment", comment);

		return mv;
	}

}
