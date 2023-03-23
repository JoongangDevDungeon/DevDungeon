package com.team.devdungeon.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.team.devdungeon.util.TextChangeUtil;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.dto.MyPageDTO;
import com.team.devdungeon.service.CSJService;
import com.team.devdungeon.service.HJHBoardService;
import com.team.devdungeon.service.MyPageService;
import com.team.devdungeon.util.SFTPFileUtil;

import lombok.RequiredArgsConstructor;

import static com.team.devdungeon.util.SFTPFileUtil.channelSftp;

@RequiredArgsConstructor
@Controller
public class HJHBoardController {
	
	private final HJHBoardService HJHboardService;
	private final CSJService csjService;
	private final MyPageService mypageService;
	private final SFTPFileUtil sftpFileUtil;
	private final TextChangeUtil textChangeUtil;
	
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
		
		//
		//작성자의 프로필을 불러온다
		int member_no = (int) boardDetail.get("member_no");
		Map<String,Object> mem = csjService.memberProfile(member_no);
		
		//이 게시글에 달린 파일 정보를 불러온다
		Map<String,Object> boardFile = csjService.callBoardFile(Integer.parseInt(board_no));
		if(boardFile != null) {
			String remotePath = sftpFileUtil.remotePath + boardFile.get("file_name");
			mv.addObject("boardFile",boardFile);

	        try {
	            // 원격 서버에서 이미지 파일 읽어오기
	            InputStream inputStream = channelSftp.get(remotePath);

	            // Inputstream -> byte[] 변환
	            ByteArrayOutputStream baos = new ByteArrayOutputStream();
	            byte[] buffer = new byte[1024];
	            int len;
	            while ((len = inputStream.read(buffer)) > -1 ) {
	            	System.out.println("ㅎㅎㅎ");
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
		mv.addObject("profile",mydto);
		
		//
		return mv;
	}
	@PostMapping("/board/HJHBoardWrite")
	public String boardWrite(HttpServletRequest request, HttpSession session,MultipartHttpServletRequest fileReq) {
		String board_title = textChangeUtil.changeText((String)request.getParameter("writeTitle"));
		String board_content = textChangeUtil.changeText((String)request.getParameter("writeContent"));
		String board_no = request.getParameter("board_no");
		String member_id = (String)session.getAttribute("member_id");
		if(board_no==null) {
//			String member_no = request.getParameter("member_no");
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("board_title", board_title);
			map.put("board_content", board_content);
			map.put("member_id", member_id);
			HJHboardService.boardWrite(map);
			
			MultipartFile boardFile = fileReq.getFile("fileUpload");
			if (boardFile.getSize() > 0) {
				String originalFileName = boardFile.getOriginalFilename(); // 원래 파일 이름
				String extension = FilenameUtils.getExtension(originalFileName); // 파일 확장자
				String savedFileName = UUID.randomUUID().toString() + "." + extension; // 저장될 파일 이름
				
				int boardNo = (int) map.get("writtenNo");
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
	@PostMapping("/board/HJHBoardComment")
	public String boardComment(HttpServletRequest request, HttpSession session) {
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
	public String boardSubComment(HttpServletRequest request, HttpSession session) {
		Map<String,Object> map = new HashMap<String, Object>();
		String subComment_content = request.getParameter("c_commentText");
		String comment_root = request.getParameter("comment_root");
		String board_no = request.getParameter("board_no");
		String member_name = (String)session.getAttribute("member_name");
		map.put("subComment_content", subComment_content);
		map.put("comment_root", comment_root);
		map.put("member_name", member_name);
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
	public String boardDelete(String board_no) {
		int result = HJHboardService.boardDelete(board_no);
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
