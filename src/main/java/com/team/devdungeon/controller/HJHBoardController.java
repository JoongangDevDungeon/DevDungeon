package com.team.devdungeon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.team.devdungeon.service.HJHBoardService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class HJHBoardController {
	
	private final HJHBoardService HJHboardService;
	
	@GetMapping("/board/HJHBoard")
	public ModelAndView boardList(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
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
	@GetMapping("/board/HJHBoardDetail")
	public ModelAndView boardDetail(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("board/HJHBoardDetail");
		String board_no = request.getParameter("board_no");
		HJHboardService.boardRead(board_no);
		Map<String, Object> boardDetail = HJHboardService.boardDetail(board_no);
		List<Map<String,Object>> detailComments = HJHboardService.detailComment(board_no);
		mv.addObject("boardDetail",boardDetail);
		mv.addObject("detailComments",detailComments);
		return mv;
	}
	@PostMapping("/board/HJHBoardComment")
	public String boardComment(HttpServletRequest request,HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		String comment_content = request.getParameter("commentText");
		String board_no = request.getParameter("board_no");
		String member_name = (String)session.getAttribute("member_name");
		map.put("comment_content", comment_content);
		map.put("member_name", member_name);
		map.put("board_no", board_no);
		System.out.println(map);
		HJHboardService.boardComment(map);
		return "redirect:/board/HJHBoardDetail?board_no="+board_no;
	}
	@PostMapping("/board/HJHSubComment")
	public String boardSubComment(HttpServletRequest request) {
		Map<String,Object> map = new HashMap<String, Object>();
		String subComment_content = request.getParameter("c_commentText");
		String comment_root = request.getParameter("comment_root");
		String board_no = request.getParameter("board_no");
		System.out.println(subComment_content+board_no);
		map.put("subComment_content", subComment_content);
		map.put("comment_root", comment_root);
		map.put("board_no", board_no);
		HJHboardService.boardSubComment(map);
		return "redirect:/board/HJHBoardDetail?board_no="+board_no;
	}
	
	@GetMapping("/board/HJHBoardWrite")
	public String boardWrite(HttpSession session) {
		
		if(session.getAttribute("member_id") == null) {
			return	"redirect:/board/HJHBoard";
		}
		return "board/HJHBoardWrite"; 	
	}
	@GetMapping("/board/HJHBoardUpdate")
	public ModelAndView boardUpdate(@RequestParam String board_no) {
		ModelAndView mv = new ModelAndView("/board/HJHBoardWrite");
		Map<String, Object> boardDetail = HJHboardService.boardDetail(board_no);
		mv.addObject("boardDetail",boardDetail);
		return mv; 
	}
	
	@PostMapping("/board/HJHBoardWrite")
	public String boardWrite(HttpServletRequest request) {
		String board_title = request.getParameter("writeTitle");
		String board_content = request.getParameter("writeContent");
		String board_no = request.getParameter("board_no");
		System.out.println(board_no);
		if(board_no==null) {
//			String member_no = request.getParameter("member_no");
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("board_title", board_title);
			map.put("board_content", board_content);
//			map.put("member_no", member_no);
			HJHboardService.boardWrite(map);
			return"redirect:/board/HJHBoard";
		}else {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("board_title", board_title);
			map.put("board_content", board_content);
			map.put("board_no", board_no);
			HJHboardService.boardUpdate(map);
			return "redirect:/board/HJHBoardDetail?board_no="+board_no;
		}
		
	}
	@ResponseBody
	@PostMapping("/board/boardLike")
	public String boardLike(String board_no) {
		System.out.println(board_no);
		int result = HJHboardService.boardLike(board_no);
		if(result==1) {
			String data = HJHboardService.boardLikeAjax(board_no);
			return data;
		}
		return result+"";
	}
	@GetMapping("/board/HJHBoardDelete")
	public String boardDelete(String comment_no) {
		int result = HJHboardService.boardDelete(comment_no);
		System.out.println(result+" 개의 게시글이 비활성화 되었습니다.");
		return "redirect:/board/HJHBoard";
	}
	
	@ResponseBody
	@PostMapping("/board/HJHBoardCommentDel")
	public String boardCommentDel(String comment_no) {
		int result = HJHboardService.boardCommentDel(comment_no);
		System.out.println(result+" 개의 댓글이 비활성화 되었습니다.");
		
		return result+"";
		
	}
	
}
