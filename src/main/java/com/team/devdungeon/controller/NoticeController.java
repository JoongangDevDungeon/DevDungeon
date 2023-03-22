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

import com.team.devdungeon.service.NoticeService;
import com.team.devdungeon.util.TextChangeUtil;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class NoticeController {
	
	private final NoticeService noticeService;
	private final TextChangeUtil textChangeUtil;
	
	
	@GetMapping("/notice")
	public ModelAndView noticeList(@RequestParam(value="pageNo", defaultValue = "1") int pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/board/notice");
		Map<String, Object> pages = new HashMap<String, Object>();
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);
		int startPage = (pageNo*10)-10;
		int totalCount = noticeService.noticeCount(pages);
		int lastPage = (int)Math.ceil((double)totalCount/10);
		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);
		List<Map<String, Object>> list = noticeService.noticeList(pages);
		for(Map<String, Object> m : list) {
			m.put("notice_title", textChangeUtil.changeText((String)m.get("notice_title")));
		}
		mv.addObject("pages",pages);
		mv.addObject("list",list);
		mv.addObject("pageNo", pageNo);
		return mv;
	}
	@GetMapping("/noticeDetail")
	public ModelAndView noticeDetail(HttpServletRequest request,HttpSession session) {
		ModelAndView mv = new ModelAndView("/board/noticeDetail");
		String notice_no = request.getParameter("notice_no");
		noticeService.noticeRead(notice_no);
		Map<String, Object> noticeDetail = noticeService.noticeDetail(notice_no);
		noticeDetail.put("notice_title",textChangeUtil.changeText((String)noticeDetail.get("notice_title")));
		noticeDetail.put("notice_content",textChangeUtil.changeText((String)noticeDetail.get("notice_content")));
		noticeDetail.put("notice_content",textChangeUtil.changeEnter((String)noticeDetail.get("notice_content")));
		List<Map<String,Object>> detailComments = noticeService.detailComment(notice_no);
		mv.addObject("noticeDetail",noticeDetail);
		mv.addObject("detailComments",detailComments);
		return mv;
	}
	@GetMapping("/noticeWrite")
	public String noticeWrite(HttpSession session) {
		if(session.getAttribute("id") == null) {
			return	"redirect:/notice";
		}
		return "/board/noticeWrite"; 	
	}
	@PostMapping("/noticeWrite")
	public String noticeWrite(HttpServletRequest request, HttpSession session) {
		String notice_title = request.getParameter("writeTitle");
		notice_title = textChangeUtil.changeText(notice_title);
		String notice_content = request.getParameter("writeContent");
		notice_content = textChangeUtil.changeText(notice_content);
		String notice_no = request.getParameter("notice_no");
		String admin_id = (String)session.getAttribute("id");
		if(notice_no==null) {
//			String member_no = request.getParameter("member_no");
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("notice_title", notice_title);
			map.put("notice_content", notice_content);
			map.put("admin_id", admin_id);
			noticeService.noticeWrite(map);
			return"redirect:/notice";
		}else {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("notice_title", notice_title);
			map.put("notice_content", notice_content);
			map.put("notice_no", notice_no);
			noticeService.noticeUpdate(map);
			return "redirect:/noticeDetail?notice_no="+notice_no;
		}
	}
	@GetMapping("/noticeUpdate")
	public ModelAndView noticeUpdate(@RequestParam String notice_no) {
		ModelAndView mv = new ModelAndView("/board/noticeWrite");
		Map<String, Object> noticeDetail = noticeService.noticeDetail(notice_no);
		mv.addObject("noticeDetail",noticeDetail);
		return mv; 
	}
	@ResponseBody
	@PostMapping("/noticeLike")
	public String boardLike(String notice_no) {
		System.out.println(notice_no);
		int result = noticeService.noticeLike(notice_no);
		if(result==1) {
			String data = noticeService.noticeLikeAjax(notice_no);
			return data;
		}
		return result+"";
	}
	
	@PostMapping("/noticeComment")
	public String noticeComment(HttpServletRequest request, HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		String comment_content = request.getParameter("commentText");
		comment_content = textChangeUtil.changeText(comment_content);
		String notice_no = request.getParameter("notice_no");
		String member_name = (String)session.getAttribute("member_name");
		map.put("comment_content", comment_content);
		map.put("member_name", member_name);
		map.put("notice_no", notice_no);
		System.out.println(map);
		noticeService.noticeComment(map);
		return "redirect:/noticeDetail?notice_no="+notice_no;
	}
	@PostMapping("/noticeSubComment")
	public String noticeSubComment(HttpServletRequest request, HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		String subComment_content = request.getParameter("c_commentText");
		subComment_content = textChangeUtil.changeText(subComment_content);
		String comment_root = request.getParameter("comment_root");
		String notice_no = request.getParameter("notice_no");
		String member_name = (String)session.getAttribute("member_name");
		map.put("subComment_content", subComment_content);
		map.put("comment_root", comment_root);
		map.put("member_name", member_name);
		map.put("notice_no", notice_no);
		noticeService.noticeSubComment(map);
		return "redirect:/noticeDetail?notice_no="+notice_no;
	}
	@GetMapping("/noticeDelete")
	public String noticeDelete(String notice_no) {
		int result = noticeService.noticeDelete(notice_no);
		System.out.println(result+" 개의 게시글이 비활성화 되었습니다.");
		return "redirect:/notice";
	}
	@ResponseBody
	@PostMapping("/noticeCommentDel")
	public String noticeCommentDel(String comment_no) {
		int result = noticeService.noticeCommentDel(comment_no);
		System.out.println(result+" 개의 댓글이 비활성화 되었습니다.");
		return result+"";
	}
	
	
	

}
