package com.team.devdungeon.controller;



import java.io.ByteArrayInputStream;



import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.team.devdungeon.dto.AdminDTO;
import com.team.devdungeon.dto.AnswerDTO;
import com.team.devdungeon.dto.BoardDTO;
import com.team.devdungeon.dto.CouponDTO;
import com.team.devdungeon.dto.EventDTO;
import com.team.devdungeon.dto.MemberDTO;
import com.team.devdungeon.dto.QuestionBoardDTO;
import com.team.devdungeon.service.AdminService;
import com.team.devdungeon.util.Excel;
import com.team.devdungeon.util.SFTPFileUtil;
import com.team.devdungeon.util.TextChangeUtil;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SFTPFileUtil sftpFileUtil;
	
	@Autowired
	private TextChangeUtil textChangeUtil;
	
	@GetMapping("/admin")
	public ModelAndView admin() {
		ModelAndView mv = new ModelAndView("./admin/admin");

		List<Map<String, Object>> today = adminService.adminToday();
		List<Map<String, Object>> date = adminService.adminDate();

		mv.addObject("today", today);
		mv.addObject("date", date);

		return mv;
	}

	// admin 막대그래프
	@GetMapping("/admin/AdminMainStatistics")
	@ResponseBody
	public List<Map<String, Object>> adminVisitor() {

		List<Map<String, Object>> visitor = adminService.adminVisitor();

		return visitor;
	}

	// 로그인
	@GetMapping("/adminLogin")
	public String adminLogin() {
		return "admin/adminLogin";
	}

	@PostMapping("/adminLogin")
	public String adminLogin(HttpServletRequest request) {
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setAdmin_id(request.getParameter("adminID"));
		adminDTO.setAdmin_pw(request.getParameter("adminPW"));

		AdminDTO result = adminService.adminLogin(adminDTO);

		if (result.getCount() == 1) {
			// 세션 만들기
			HttpSession session = request.getSession();
			session.setAttribute("id", result.getAdmin_id());
			session.setAttribute("grade", result.getAdmin_grade());

			return "redirect:/admin";
		} else {
			return "redirect:/adminLogin?error=login_fail";
		}

	}

	// 로그아웃
	@GetMapping("/adminLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin";
	}

	// 사용자관리
	@GetMapping("/adminMember")
	public ModelAndView adminMember(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminMember");
		Map<String, Object> pages = new HashMap<String, Object>();

		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");

		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);

		int startPage = (pageNo * 10) - 10;
		int totalCount = adminService.adminMemberCount(pages);
		int lastPage = (int) Math.ceil((double) totalCount / 10);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);

		List<Map<String, Object>> list = adminService.adminMember(pages);

		mv.addObject("pages", pages);
		mv.addObject("list", list);
		mv.addObject("pageNo", pageNo);

		return mv;
	}

	@PostMapping("/adminMember")
	public String adminMember(HttpServletRequest request) {

		String pageNo = request.getParameter("pageNo");

		MemberDTO memberDTO = new MemberDTO();

		memberDTO.setMember_grade(Integer.parseInt(request.getParameter("member_grade")));
		memberDTO.setMember_no(Integer.parseInt(request.getParameter("member_no")));

		adminService.memberUpdate(memberDTO);

		return "redirect:/adminMember?pageNo=" + pageNo;
	}

	// 게시글 관리
	@GetMapping("/adminBoard")
	public ModelAndView adminBoard(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminBoard");

		Map<String, Object> pages = new HashMap<String, Object>();

		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");

		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);

		int startPage = (pageNo * 10) - 10;
		int totalCount = adminService.boardCount(pages);
		int lastPage = (int) Math.ceil((double) totalCount / 10);

		// System.out.println(startPage);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);

		List<Map<String, Object>> list = adminService.AdminBoard(pages);

		mv.addObject("pages", pages);
		mv.addObject("list", list);
		mv.addObject("pageNo", pageNo);

		return mv;
	}
	// 게시글 Detail
	@GetMapping("/adminBoardDetail")
	public ModelAndView adminBoardDetail(@RequestParam(value = "board_no") int boardNo, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminBoardDetail");
		
		List<Map<String, Object>> list = adminService.AdminBoardDetail(boardNo);
		
		mv.addObject("list", list);
		
		return mv;
	}

	// 게시글 삭제
	@PostMapping("/adminBoard")
	public String adminBoardDel(HttpServletRequest request) {

		String pageNo = request.getParameter("pageNo");

		BoardDTO boardDTO = new BoardDTO();

		boardDTO.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		boardDTO.setStatus_no(Integer.parseInt(request.getParameter("status_no")));

		adminService.adminBoardDel(boardDTO);

		return "redirect:/adminBoard?pageNo=" + pageNo;
	}

	// 로그 데이터
	@GetMapping("/adminLog")
	public ModelAndView adminLog(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminLog");
		Map<String, Object> pages = new HashMap<String, Object>();

		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");

		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);

		int startPage = (pageNo * 10) - 10;
		int totalCount = adminService.adminLogCount(pages);
		int lastPage = (int) Math.ceil((double) totalCount / 10);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);

		List<Map<String, Object>> list = adminService.AdminLog(pages);

		mv.addObject("pages", pages);
		mv.addObject("pageNo", pageNo);
		mv.addObject("list", list);

		return mv;
	}

	// 통계

	@GetMapping("/adminStatistics")
	public ModelAndView adminStatistics() {
		ModelAndView mv = new ModelAndView("./admin/adminStatistics");
		return mv;
	}

	//엑셀로 받기
	@ResponseBody
	@GetMapping("/adminStatistics/{type}")
	public String adminStatistics(HttpServletRequest request, HttpServletResponse response, @PathVariable String type) {
		
		List<Map<String, Object>> result = null;
		switch (type) {
		case "time":
			result = adminService.excelTime();
			break;
		case "day":
			result = adminService.excelDay();
			break;

		case "month":
			result = adminService.excelMonth();
			break;

		default:
			break;
		}
		Excel excel = new Excel();
		try {
			excel.createExcelFromHashMap(response, result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		

		return "/adminStatistics";
	}


	// StatisticsMonth 막대그래프
	@GetMapping("/admin/StatisticsMonth")
	@ResponseBody
	public List<Map<String, Object>> StatisticsMonth() {

		List<Map<String, Object>> month = adminService.LogMonth();

		return month;
	}

	// StatisticsDay 막대그래프
	@GetMapping("/admin/StatisticsDay")
	@ResponseBody
	public List<Map<String, Object>> StatisticsDay() {

		List<Map<String, Object>> day = adminService.LogDay();

		return day;
	}

	// StatisticsTime 막대그래프
	@GetMapping("/admin/StatisticsTime")
	@ResponseBody
	public List<Map<String, Object>> StatisticsTime() {

		List<Map<String, Object>> time = adminService.LogTime();

		return time;
	}

	// 쿠폰발급(페이징 서치바 추가)
	@GetMapping("/adminCoupon")
	public ModelAndView adminCoupon(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminCoupon");

		Map<String, Object> pages = new HashMap<String, Object>();

		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");

		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);

		int startPage = (pageNo * 10) - 10;
		int totalCount = adminService.adminCouponCount(pages);
		int lastPage = (int) Math.ceil((double) totalCount / 10);

		// System.out.println(startPage);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);

		List<Map<String, Object>> list = adminService.adminCoupon(pages);

		mv.addObject("pages", pages);
		mv.addObject("list", list);
		mv.addObject("pageNo", pageNo);

		return mv;
	}

	@GetMapping("/adminCouponCreate")
	public ModelAndView adminCouponCreate() {
		ModelAndView mv = new ModelAndView("/admin/adminCouponCreate");
		List<Map<String, Object>> list = adminService.AdminCouponView();

		mv.addObject("list", list);

		return mv;
	}

	@PostMapping("/adminCouponCreate")
	public String adminCouponCreate(HttpServletRequest request) {
		CouponDTO couponDTO = new CouponDTO();

		couponDTO.setCoupon_name(request.getParameter("couponName"));
		couponDTO.setEvent_no(Integer.parseInt(request.getParameter("event_no")));
		couponDTO.setCoupon_end(request.getParameter("endDate"));
		couponDTO.setCoupon_content(Integer.parseInt(request.getParameter("couponContent")));
		System.out.println(couponDTO);

		adminService.adminCouponCreate(couponDTO);
		return "redirect:/adminCoupon";
	}

	@ResponseBody
	@RequestMapping(value = "/adminCouponDel", method = { RequestMethod.POST })
	public void test(@RequestParam("couponDel") int couponDel) {
		adminService.adminCouponDel(couponDel);

	}

	// QnA
	@GetMapping("/adminQnA")
	public ModelAndView adminQnA(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminQnA");

		Map<String, Object> pages = new HashMap<String, Object>();

		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");

		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);

		int startPage = (pageNo * 10) - 10;
		int totalCount = adminService.adminQnACount(pages);
		int lastPage = (int) Math.ceil((double) totalCount / 10);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);

		List<Map<String, Object>> qna = adminService.adminQnA(pages);

		mv.addObject("qna", qna);
		mv.addObject("pages", pages);
		mv.addObject("pageNo", pageNo);

		return mv;
	}

	@GetMapping("/adminAnswer")
	public ModelAndView adminAnswer(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminAnswer");
		int no = Integer.parseInt(request.getParameter("qnaNo"));

		List<QuestionBoardDTO> qna = adminService.Answer(no);
		mv.addObject("qna", qna);
		return mv;
	}

	@PostMapping("/adminAnswerComplete")
	public String adminAnswerComplete(HttpServletRequest request) {
		AnswerDTO answerDTO = new AnswerDTO();

		answerDTO.setAnswer_board_content(request.getParameter("answerContent"));
		answerDTO.setQuestion_board_no(Integer.parseInt(request.getParameter("questionNo")));
		answerDTO.setAnswer_board_title(request.getParameter("answerTitle"));

		adminService.adminAnswerComplete(answerDTO);
		int change = Integer.parseInt(request.getParameter("questionNo"));
		adminService.adminAnswerChange(change);

		return "redirect:/adminQnA";
	}

	// 스토어
	@GetMapping("/adminStore")
	public ModelAndView adminStore(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminStore");
		Map<String, Object> pages = new HashMap<String, Object>();

		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");

		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);

		int startPage = (pageNo * 10) - 10;
		int totalCount = adminService.adminStoreCount(pages);
		int lastPage = (int) Math.ceil((double) totalCount / 10);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);

		List<Map<String, Object>> list = adminService.AdminStore(pages);

		mv.addObject("pages", pages);
		mv.addObject("pageNo", pageNo);
		mv.addObject("list", list);

		return mv;
	}

	// 스토어 상태변경
	@PostMapping("/adminStore")
	public String adminStoreChange(HttpServletRequest request) {
		System.out.println(request.getParameter("product_no"));
		System.out.println(request.getParameter("emoticon_authority"));

		Map<String, Object> change = new HashMap<String, Object>();

		String product_no = request.getParameter("product_no");
		String emoticon_authority = request.getParameter("emoticon_authority");

		change.put("product_no", product_no);
		change.put("emoticon_authority", emoticon_authority);

		adminService.amdinStoreChange(change);

		return "redirect:/adminStore";
	}

	// 이벤트
	@GetMapping("/adminEvent")
	public ModelAndView adminEvent(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("./admin/adminEvent");
		Map<String, Object> pages = new HashMap<String, Object>();

		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");

		pages.put("searchType", searchType);
		pages.put("searchValue", searchValue);

		int startPage = (pageNo * 10) - 10;
		int totalCount = adminService.adminEventCount(pages);
		int lastPage = (int) Math.ceil((double) totalCount / 10);

		pages.put("startPage", startPage);
		pages.put("lastPage", lastPage);

		List<Map<String, Object>> list = adminService.AdminEvent(pages);

		mv.addObject("pages", pages);
		mv.addObject("pageNo", pageNo);

		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/adminEventWrite")
	public ModelAndView adminEventWrite() {
		ModelAndView mv = new ModelAndView("./admin/adminEventWrite");
		return mv;
	}

	@PostMapping("/adminEventWrite")
	public String adminEventWrite(HttpServletRequest request, MultipartHttpServletRequest fileReq) {
		EventDTO eventDTO = new EventDTO();
		
		eventDTO.setEvent_title(textChangeUtil.changeText(request.getParameter("eventTitle")));
		eventDTO.setEvent_content(textChangeUtil.changeText(request.getParameter("eventContent")));
		eventDTO.setTag_no(Integer.parseInt(request.getParameter("eventTag")));
		eventDTO.setEvent_end(request.getParameter("EventEndDate"));
		
		adminService.adminEventWrite(eventDTO);
		
		MultipartFile eventFile = fileReq.getFile("eventfile");

		String originalFileName = eventFile.getOriginalFilename(); // 원래 파일 이름
		String extension = FilenameUtils.getExtension(originalFileName); // 파일 확장자
		String savedFileName = UUID.randomUUID().toString() + "." + extension; // 저장될 파일 이름
		
		int eventNo = eventDTO.getWrittenNo();
		String remotePath = sftpFileUtil.remotePath + savedFileName;//수정
		long fileSize = eventFile.getSize();
		
		Map<String,Object> fileMap = new HashMap<String, Object>();
		
		fileMap.put("event_no", eventNo);
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

            InputStream inputStream = new ByteArrayInputStream(eventFile.getBytes());

            sftpChannel.put(inputStream, remotePath);

            sftpChannel.exit();
            jschSession.disconnect();
            adminService.puteventFile(fileMap);
        } catch (Exception e) {
            e.printStackTrace();
        }

		System.out.println("저장 파일 위치, 파일명 : " + remotePath);
		System.out.println("파일 크기 : "+ fileSize);

		return "redirect:/adminEvent";
		
		/*else {
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("event_title", eventDTO.getEvent_title());
			map.put("event_content", eventDTO.getEvent_content());
			
			adminService.adminEventWrite(eventDTO);
			
			return "redirect:/adminEvent";
		}*/

	}
	
	@PostMapping("/adminEventModal")
	public String adminEventModal(HttpServletRequest request) {
		EventDTO eventDTO = new EventDTO();
		
		String pageNo = request.getParameter("pageNo");
		
		eventDTO.setEvent_player(Integer.parseInt(request.getParameter("winner")));
		eventDTO.setEvent_player(Integer.parseInt(request.getParameter("eventNo")));
		
		adminService.adminEventModal(eventDTO);
		
//		System.out.println(request.getParameter("winner"));
//		System.out.println(request.getParameter("eventNo"));
//		System.out.println(pageNo);
		
		return "redirect:/adminEvent?pageNo=" + pageNo;
	}
	
	// 이벤트 삭제
	@PostMapping("/adminEvent")
	public String adminEventDel(HttpServletRequest request) {

		String pageNo = request.getParameter("pageNo");

		EventDTO eventDTO = new EventDTO();

		eventDTO.setEvent_no(Integer.parseInt(request.getParameter("event_no")));
		eventDTO.setStatus_no(Integer.parseInt(request.getParameter("status_no")));

		adminService.adminEventDel(eventDTO);

		return "redirect:/adminEvent?pageNo=" + pageNo;
	}

	// 포인트
	@GetMapping("/adminPoint")
	public ModelAndView adminPoint() {
		ModelAndView mv = new ModelAndView("./admin/adminPoint");

		return mv;
	}

}