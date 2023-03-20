package com.team.devdungeon.controller;

import static com.team.devdungeon.util.SFTPFileUtil.channelSftp;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;
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
		if(searchValue!=null) {
			dto.setSearchType(searchType);
			dto.setSearchValue(searchValue);
		}
		PageInfo<Map<String, Object>> pageList = csjService.eventList(dto);
		for(Map<String,Object> m : pageList.getList()) {
			if(m.get("event_file_no") != null) {
				String remotePath = "/home/woori/ftp/files/" + m.get("event_file_name");
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
		            m.put("imageDataString", imageDataString);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
			}
		}
		mv.addObject("pageNo", pageNo);
		mv.addObject("pageInfo", pageList);
		mv.addObject("searchType", searchType);
		mv.addObject("searchValue", searchValue);
		mv.addObject("list", pageList.getList());
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
		Map<String, Object> eventFile = csjService.callEventFile(bno);
		if(eventFile!=null) {
			String remotePath = "/home/woori/ftp/files/" + eventFile.get("event_file_name");
			mv.addObject("eventFile",eventFile);

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
		mv.addObject("det", det);
		return mv;
	}

}
