package com.team.devdungeon.controller;

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

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class CSJController {

	private final CSJService csjService;
	private final MyPageService mypageService;
	private final SFTPFileUtil sftpFileUtil;

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
	public ModelAndView csjWritePost(HttpServletRequest request, MultipartHttpServletRequest fileReq) {
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
			int result = csjService.write(writemap);
			System.out.println(writemap.get("number"));
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
		            JSch jsch = new JSch();

		            Session jschSession = jsch.getSession(sftpFileUtil.FTP_USER, sftpFileUtil.FTP_HOST, sftpFileUtil.FTP_PORT);
		            jschSession.setPassword(sftpFileUtil.FTP_PASSWORD);
		            jschSession.setConfig("StrictHostKeyChecking", "no");
		            jschSession.connect();

		            ChannelSftp sftpChannel = (ChannelSftp) jschSession.openChannel("sftp");
		            sftpChannel.connect();

		            InputStream inputStream = new ByteArrayInputStream(boardFile.getBytes());

		            sftpChannel.put(inputStream, remotePath);

		            sftpChannel.exit();
		            jschSession.disconnect();
		            csjService.putBoardFile(fileMap);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }

				System.out.println("저장 파일 위치, 파일명 : " + remotePath);
				System.out.println("파일 크기 : "+ fileSize);
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
		int member_no = (int) det.get("member_no");
		Map<String, Object> mem = csjService.memberProfile(member_no);

		List<Map<String, Object>> comment = csjService.commentList(bno);
		
		Map<String,Object> boardFile = csjService.callBoardFile(bno);
		if(boardFile != null) {
			String remotePath = "/home/woori/ftp/files/" + boardFile.get("file_name");
			mv.addObject("boardFile",boardFile);

	        try {
	            JSch jsch = new JSch();

	            Session session = jsch.getSession(sftpFileUtil.FTP_USER, sftpFileUtil.FTP_HOST, sftpFileUtil.FTP_PORT);
	            session.setPassword(sftpFileUtil.FTP_PASSWORD);
	            session.setConfig("StrictHostKeyChecking", "no");
	            session.connect();

	            ChannelSftp sftpChannel = (ChannelSftp) session.openChannel("sftp");
	            sftpChannel.connect();

	            // 원격 서버에서 이미지 파일 읽어오기
	            InputStream inputStream = sftpChannel.get(remotePath);

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
	            sftpChannel.exit();
	            session.disconnect();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
			
		}
		MyPageDTO mydto = mypageService.profile((String)mem.get("member_id"));
		mv.addObject("det", det);
		mv.addObject("mem", mem);
		mv.addObject("comment", comment);
		mv.addObject("profile",mydto);

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
			} else if (request.getParameter("formbanType").equals("댓글 신고")) {
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
			} else {
				System.out.println("unknown way");
				return "redirect:/csjCloser";
			}
		}
	}
	
	@GetMapping("/qnaboard")
	public ModelAndView qna(@RequestParam(defaultValue = "1")int pageNo) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/Qnaboard");
		
		int pageSize = 10;
		CSJshowDTO dto = new CSJshowDTO();
		dto.setPageNo(pageNo);
		dto.setPageSize(pageSize);
		PageInfo<Map<String,Object>> qnaPageInfo = csjService.qnaList(dto);
		mv.addObject("pageInfo",qnaPageInfo);
		mv.addObject("list",qnaPageInfo.getList());
		
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/qnaWrite")
	public String qnaWrite(HttpServletRequest request,HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("title", request.getParameter("title"));
		map.put("content", request.getParameter("content"));
		map.put("member_name", session.getAttribute("member_name"));
		int result = (int)csjService.qnaWrite(map);
		//json형태로 내보내기
		JSONObject json = new JSONObject();//json으로변환
		json.put("result", result);
		return json.toString(); //json타입을 String화
	}
}
