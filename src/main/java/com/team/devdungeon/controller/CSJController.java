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
public class CSJController {

	private final CSJService csjService;

	private final ServletContext context;
	
	@GetMapping("/csjboard")
	public ModelAndView csjboard(@RequestParam(defaultValue = "1") Integer pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/CSJBoard");

		int pageSize = 10;
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

		PageInfo<Map<String, Object>> pageList = csjService.pageList(dto);

		mv.addObject("pageNo", pageNo);
		mv.addObject("pageInfo", pageList);
		mv.addObject("searchType", searchType);
		mv.addObject("searchValue", searchValue);
		mv.addObject("list", pageList.getList());
		return mv;
	}

	@GetMapping("/csjWrite")
	public ModelAndView csjWrite(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("member_name") == null) {
			mv.setViewName("redirect:/csjboard");
		} else {
			mv.setViewName("board/CSJWrite");
		}
		return mv;
	}

	@PostMapping("/csjWrite")
	public ModelAndView csjWritePost(HttpServletRequest request,MultipartFile file) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/csjboard");
		HttpSession session = request.getSession();
		if (session.getAttribute("member_name") == null) {
			return mv;
		} else {
			String writer = (String) session.getAttribute("member_name");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String category = request.getParameter("category");
			String tag = request.getParameter("tag");
			Map<String, Object> writemap = new HashMap<String, Object>();
			writemap.put("member_name", writer);
			writemap.put("title", title);
			writemap.put("content", content);
			writemap.put("category", category);
			writemap.put("tag", tag);
			String fileName = null;

			int result = csjService.write(writemap);
			return mv;
		}
	}

	@GetMapping("/csjBoardUpdate")
	public ModelAndView csjUpdate(@RequestParam(value = "bno") int bno, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/CSJUpdate");
		HttpSession session = request.getSession();
		if (session.getAttribute("member_name") == null) {
			mv.setViewName("redirect:/csjboard");
			return mv;
		} else {
			Map<String, Object> det = csjService.detail(bno);
			if (session.getAttribute("member_name").equals(det.get("member_name"))) {
				mv.addObject("det", det);
				mv.addObject("bno", bno);
			} else {
				mv.setViewName("redirect:/csjboard");
			}
			return mv;
		}
	}

	@PostMapping("/csjBoardUpdate")
	public ModelAndView csjUpdatePost(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/csjboard");
		HttpSession session = request.getSession();
		if (session.getAttribute("member_name") == null) {
			return mv;
		} else {
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String tag = request.getParameter("tag");
			String file = request.getParameter("file");
			String bno = request.getParameter("bno");
			Map<String, Object> updatemap = new HashMap<String, Object>();
			updatemap.put("board_no", bno);
			updatemap.put("title", title);
			updatemap.put("content", content);
			updatemap.put("tag", tag);
			updatemap.put("file", file);

			int result = csjService.updateBoard(updatemap);
			return mv;
		}
	}

	@GetMapping("/csjDetail")
	public ModelAndView detail(@RequestParam(value = "bno") int bno) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/CSJDetail");

		Map<String, Object> det = csjService.detail(bno);
		if(det==null) {
			mv.setViewName("redirect:/csjboard");
			return mv;
		}
		int member_no = (int) det.get("member_no");
		Map<String, Object> mem = csjService.memberProfile(member_no);

		List<Map<String, Object>> comment = csjService.commentList(bno);

		mv.addObject("det", det);
		mv.addObject("mem", mem);
		mv.addObject("comment", comment);

		return mv;
	}

	@GetMapping("/likethis")
	public String likethis(@RequestParam(value = "bno") int bno) {
		int result = csjService.likethis(bno);
		return "redirect:/csjDetail?bno=" + bno;
	}

	@GetMapping("/csjRead")
	public String readthis(@RequestParam(value = "bno") int bno) {
		int result = csjService.readthis(bno);
		return "redirect:/csjDetail?bno=" + bno;
	}

	@PostMapping("/csjCommentWrite")
	public String csjCommentWrite(@RequestParam(value = "bno") int bno, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("member_name");

		String content = request.getParameter("commentContent");
		Map<String, Object> comment = new HashMap<String, Object>();
		comment.put("board_no", bno);
		comment.put("writer", writer);
		comment.put("content", content);
		int result = csjService.commentWrite(comment);
		return "redirect:/csjDetail?bno=" + bno;
	}

	@PostMapping("/csjReplyWrite")
	public String csjReplyWrite(@RequestParam(value = "bno") int bno, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("member_name");
		String content = request.getParameter("commentContent");
		String root = request.getParameter("root");
		Map<String, Object> comment = new HashMap<String, Object>();
		comment.put("board_no", bno);
		comment.put("writer", writer);
		comment.put("content", content);
		comment.put("root", root);
		int result = csjService.ReplyWrite(comment);
		return "redirect:/csjDetail?bno=" + bno;
	}

	@GetMapping("/userBoardDelete")
	public String csjuserDelete(@RequestParam(value = "bno") int bno) {

		csjService.userDelete(bno);
		return "redirect:/csjboard";
	}

	@GetMapping("/userCommentDelete")
	public String csjCommentDelete(@RequestParam(value = "cno") int cno, HttpServletRequest request) {
		csjService.userCommentDelete(cno);
		return "redirect:" + request.getHeader("Referer");
	}

	@GetMapping("/csjfaq")
	public ModelAndView csjfaq(@RequestParam(defaultValue = "1") Integer pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/board/CSJFAQ");
		int pageSize = 10;
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		CSJshowDTO dto = new CSJshowDTO();
		dto.setPageNo(pageNo);
		dto.setPageSize(pageSize);

		if (searchType != null && searchValue != null) {
			dto.setSearchType(searchType);
			dto.setSearchValue(searchValue);
		}

		PageInfo<Map<String, Object>> faqList = csjService.faqList(dto);
		mv.addObject("faqList", faqList.getList());
		mv.addObject("pageInfo", faqList);
		return mv;
	}
	
	@GetMapping("/csjCloser")
	public String csjCloser() {
		return "board/CSJcloser";
	}

	@GetMapping("/csjBan")
	public String csjban() {
		return "board/CSJBan";
	}

	@PostMapping("/csjBan")
	public String csjbanPost(HttpServletRequest request) {
		if (request.getSession().getAttribute("member_name") == null) {
			return "redirect:/csjCloser";
		} else {
			if (request.getParameter("formbanType").equals("게시글 신고")) {
				String banBoard = request.getParameter("banBoard");
				String banMember = request.getParameter("banMember");
				String banWhy = request.getParameter("banWhy");
				String singoman = (String) request.getSession().getAttribute("member_name");
				Map<String, Object> banMap = new HashMap<String, Object>();
				banMap.put("banBoard", banBoard);
				banMap.put("banMember", banMember);
				banMap.put("banWhy", banWhy);
				banMap.put("singoman", singoman);
				csjService.banBoard(banMap);
				return "board/CSJcloser";
			}else if(request.getParameter("formbanType").equals("댓글 신고")){
				String banComment = request.getParameter("banComment");
				String banBoard = request.getParameter("banBoard");
				String banMember = request.getParameter("banMember");
				String banWhy = request.getParameter("banWhy");
				String singoman = (String) request.getSession().getAttribute("member_name");
				Map<String, Object> banMap = new HashMap<String, Object>();
				banMap.put("banComment", banComment);
				banMap.put("banBoard", banBoard);
				banMap.put("banMember", banMember);
				banMap.put("banWhy", banWhy);
				banMap.put("singoman", singoman);
				csjService.banComment(banMap);
				return "redirect:/csjCloser";
			}else {
				System.out.println("unknown way");
				return "redirect:/csjCloser";
			}
		}
	}
}
