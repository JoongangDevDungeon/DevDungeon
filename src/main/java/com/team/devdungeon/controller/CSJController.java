package com.team.devdungeon.controller;

import static com.team.devdungeon.util.SFTPFileUtil.channelSftp;
import static com.team.devdungeon.util.SFTPFileUtil.remotePath;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.dto.CSJshowDTO;
import com.team.devdungeon.dto.MyPageDTO;
import com.team.devdungeon.service.CSJService;
import com.team.devdungeon.service.MyPageService;
import com.team.devdungeon.util.SFTPFileUtil;
import com.team.devdungeon.util.TextChangeUtil;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CSJController {

	private final CSJService csjService;
	private final MyPageService mypageService;
	private final SFTPFileUtil sftpFileUtil;
	private final TextChangeUtil textChangeUtil;

	@GetMapping("/csjboard")
	public ModelAndView csjboard(@RequestParam(defaultValue = "1") Integer pageNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/CSJBoard");

		int pageSize = 10;
		int category = 2; // 카테고리에 맞는 글만 불러오도록 쿼리 수정
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
		for(Map<String,Object> m : pageList.getList()) {
			m.put("board_title", textChangeUtil.changeText((String)m.get("board_title")));
		}
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
	public ModelAndView csjWritePost(HttpServletRequest request, MultipartHttpServletRequest fileReq) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/csjboard");
		HttpSession session = request.getSession();
		if (session.getAttribute("member_name") == null) {
			return mv;
		} else {
			String writer = (String) session.getAttribute("member_name");
			String title = request.getParameter("title");
			title = textChangeUtil.changeText(title);
			String content = request.getParameter("content");
			content = textChangeUtil.changeText(content);
			String category = request.getParameter("category");
			String tag = request.getParameter("tag");
			Map<String, Object> writemap = new HashMap<String, Object>();
			writemap.put("member_name", writer);
			writemap.put("title", title);
			writemap.put("content", content);
			writemap.put("category", category);
			writemap.put("tag", tag);
			int result = csjService.write(writemap);
			if(result==1) {
				Map<String, Object> pointMap = new HashMap<String, Object>();
				pointMap.put("member_name", writer);
				pointMap.put("pointType", 2);
				csjService.addPoint(pointMap);
			}
			int boardNo = (int) writemap.get("number");
			MultipartFile boardFile = fileReq.getFile("board_file");
			System.out.println(boardFile.getSize());
			if (boardFile.getSize() > 0) {
				String originalFileName = boardFile.getOriginalFilename(); // 원래 파일 이름
				String extension = FilenameUtils.getExtension(originalFileName); // 파일 확장자
				String savedFileName = UUID.randomUUID().toString() + "." + extension; // 저장될 파일 이름
				
				String remotePath = sftpFileUtil.remotePath + savedFileName;
				long fileSize = boardFile.getSize();
				Map<String,Object> fileMap = new HashMap<String, Object>();
				
				fileMap.put("board_no", boardNo);
				fileMap.put("fileName", savedFileName);
				fileMap.put("extension", extension);
				fileMap.put("fileSize", fileSize);

		        try {
		            InputStream inputStream = new ByteArrayInputStream(boardFile.getBytes());
		            channelSftp.put(inputStream, remotePath);
		            csjService.putBoardFile(fileMap);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

			}
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
				det.put("board_title",textChangeUtil.changeText((String)det.get("board_title")));
				det.put("board_content",textChangeUtil.changeText((String)det.get("board_content")));
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
			title = textChangeUtil.changeText(title);
			String content = request.getParameter("content");
			content = textChangeUtil.changeText(content);
			String tag = request.getParameter("tag");
			String bno = request.getParameter("bno");
			Map<String, Object> updatemap = new HashMap<String, Object>();
			updatemap.put("board_no", bno);
			updatemap.put("title", title);
			updatemap.put("content", content);
			updatemap.put("tag", tag);

			int result = csjService.updateBoard(updatemap);
			return mv;
		}
	}

	@GetMapping("/csjDetail")
	public ModelAndView detail(@RequestParam(value = "bno") int bno) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/CSJDetail");

		Map<String, Object> det = csjService.detail(bno);
		if (det == null) {
			mv.setViewName("redirect:/csjboard");
			return mv;
		}
		det.put("board_title", textChangeUtil.changeText((String)det.get("board_title")));
		det.put("board_content", textChangeUtil.changeText((String)det.get("board_content")));
		det.put("board_content", textChangeUtil.changeEnter((String)det.get("board_content")));
		int member_no = (int) det.get("member_no");
		Map<String, Object> mem = csjService.memberProfile(member_no);

		List<Map<String, Object>> comment = csjService.commentList(bno);
		for(Map<String,Object> m : comment) {
			m.put("comment_content", textChangeUtil.changeText((String)m.get("comment_content")));
		}
		
		Map<String,Object> boardFile = csjService.callBoardFile(bno);
		if(boardFile != null) {
			String remotePath = "/home/woori/ftp/files/" + boardFile.get("file_name");
			mv.addObject("boardFile",boardFile);

	        try {
	            // 원격 서버에서 이미지 파일 읽어오기
	            InputStream inputStream = channelSftp.get(remotePath);
	            // Inputstream -> byte[] 변환
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();
	            byte[] buffer = new byte[1024];
	            int len;
	            while ((len = inputStream.read(buffer)) > -1 ) {
	                baos.write(buffer, 0, len);
	            }
	            baos.flush();
	            byte[] imageData = baos.toByteArray();
	            // byte[] -> Base64
	            String imageDataString = Base64.getEncoder().encodeToString(imageData);
	            mv.addObject("imageDataString", imageDataString);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			
		}
		MyPageDTO mydto = mypageService.profile((String)mem.get("member_id"));
		mydto.setMember_intro(textChangeUtil.changeText(mydto.getMember_intro()));
		mv.addObject("det", det);
		mv.addObject("mem", mem);
		mv.addObject("comment", comment);
		mv.addObject("profile",mydto);

		return mv;
	}

	@GetMapping("/likethis")
	public String likethis(@RequestParam(value = "bno") int bno,HttpSession session) {
		if(session.getAttribute("member_name")!=null) {
			int result = csjService.likethis(bno);
		}
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
		content = textChangeUtil.changeText(content);
		Map<String, Object> comment = new HashMap<String, Object>();
		comment.put("board_no", bno);
		comment.put("writer", writer);
		comment.put("content", content);
		int result = csjService.commentWrite(comment);
		System.out.println("댓글 result:"+result);
		if(result>0) {
			Map<String, Object> pointMap = new HashMap<String, Object>();
			pointMap.put("member_name", writer);
			pointMap.put("pointType", 3);
			csjService.addPoint(pointMap);
		}
		return "redirect:/csjDetail?bno=" + bno;
	}

	@PostMapping("/csjReplyWrite")
	public String csjReplyWrite(@RequestParam(value = "bno") int bno, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("member_name");
		String content = request.getParameter("commentContent");
		content = textChangeUtil.changeText(content);
		String root = request.getParameter("root");
		Map<String, Object> comment = new HashMap<String, Object>();
		comment.put("board_no", bno);
		comment.put("writer", writer);
		comment.put("content", content);
		comment.put("root", root);
		int result = csjService.ReplyWrite(comment);
		if(result==1) {
			Map<String, Object> pointMap = new HashMap<String, Object>();
			pointMap.put("member_name", writer);
			pointMap.put("pointType", 3);
			csjService.addPoint(pointMap);
		}
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

	@ResponseBody
	@PostMapping("/eventJoin")
	public String eventJoin(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id")==null) {
			return "redirect:" + request.getHeader("Referer");
		}
		String member_id = (String) session.getAttribute("member_id");
		String event_no = request.getParameter("event_no");
		map.put("event_no", event_no);
		map.put("member_id", member_id);
		int result = csjService.eventJoin(map);
		
		JSONObject json = new JSONObject();//json으로변환
		json.put("result", result);
		return json.toString(); //json타입을 String화
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
				banWhy = textChangeUtil.changeText(banWhy);
				String singoman = (String) request.getSession().getAttribute("member_name");
				Map<String, Object> banMap = new HashMap<String, Object>();
				banMap.put("banBoard", banBoard);
				banMap.put("banMember", banMember);
				banMap.put("banWhy", banWhy);
				banMap.put("singoman", singoman);
				csjService.banBoard(banMap);
				return "board/CSJcloser";
			} else if (request.getParameter("formbanType").equals("댓글 신고")) {
				String banComment = request.getParameter("banComment");
				String banBoard = request.getParameter("banBoard");
				String banMember = request.getParameter("banMember");
				String banWhy = request.getParameter("banWhy");
				banWhy = textChangeUtil.changeText(banWhy);
				String singoman = (String) request.getSession().getAttribute("member_name");
				Map<String, Object> banMap = new HashMap<String, Object>();
				banMap.put("banComment", banComment);
				banMap.put("banBoard", banBoard);
				banMap.put("banMember", banMember);
				banMap.put("banWhy", banWhy);
				banMap.put("singoman", singoman);
				csjService.banComment(banMap);
				return "redirect:/csjCloser";
			} else {
				System.out.println("unknown way");
				return "redirect:/csjCloser";
			}
		}
	}
	
	@GetMapping("/faqboard")
	public ModelAndView faq(@RequestParam(defaultValue = "1")int pageNo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/Faqboard");
		
		int pageSize = 10;
		CSJshowDTO dto = new CSJshowDTO();
		dto.setPageNo(pageNo);
		dto.setPageSize(pageSize);
		PageInfo<Map<String,Object>> faqPageInfo = csjService.faqList(dto);
		for(Map<String,Object> m : faqPageInfo.getList()) {
			m.put("faq_question", textChangeUtil.changeText((String)m.get("faq_question")));
			m.put("faq_answer", textChangeUtil.changeText((String)m.get("faq_answer")));
		}
		mv.addObject("pageInfo",faqPageInfo);
		mv.addObject("list",faqPageInfo.getList());
		
		return mv;
	}
	@GetMapping("/qnaboard")
	public ModelAndView qna(@RequestParam(defaultValue = "1")int pageNo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/Qnaboard");
		
		String member_id = (String) request.getSession().getAttribute("member_id");
		int pageSize = 10;
		CSJshowDTO dto = new CSJshowDTO();
		dto.setPageNo(pageNo);
		dto.setPageSize(pageSize);
		dto.setMember_id(member_id);
		PageInfo<Map<String,Object>> qnaPageInfo = csjService.qnaList(dto);
		for(Map<String,Object> m : qnaPageInfo.getList()) {
			m.put("question_board_title", textChangeUtil.changeText((String)m.get("question_board_title")));
			m.put("question_board_content", textChangeUtil.changeText((String)m.get("question_board_content")));
		}
		mv.addObject("pageInfo",qnaPageInfo);
		mv.addObject("list",qnaPageInfo.getList());
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/qnaWrite")
	public String qnaWrite(HttpServletRequest request,HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("title", textChangeUtil.changeText(request.getParameter("title")));
		map.put("content", textChangeUtil.changeText(request.getParameter("content")));
		map.put("member_name", session.getAttribute("member_name"));
		int result = (int)csjService.qnaWrite(map);
		//json형태로 내보내기
		JSONObject json = new JSONObject();//json으로변환
		json.put("result", result);
		return json.toString(); //json타입을 String화
	}
}
