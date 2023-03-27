package com.team.devdungeon.log;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.team.devdungeon.log.LogModel;
import com.team.devdungeon.log.LogRepository;

@Component
public class LoggingInterceptor extends HandlerInterceptorAdapter {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private LogRepository logRepository;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// 클라이언트 IP 정보 추출
		String ipAddress = request.getHeader("X-Forwarded-For");
		if (ipAddress == null) {
			ipAddress = request.getRemoteAddr();
		}

		// HTTP 요청 파라미터 값 추출
		StringBuilder params = new StringBuilder();
		Enumeration<String> paramNames = request.getParameterNames();
		while (paramNames.hasMoreElements()) {
			String paramName = paramNames.nextElement();
			String[] paramValues = request.getParameterValues(paramName);
			for (String paramValue : paramValues) {
				params.append(paramName).append("=").append(paramValue).append("&");
			}
		}

		String paramString = params.toString();

		if (paramString.length() > 0) {
			paramString = paramString.substring(0, paramString.length() - 1);
		}
		String path = request.getRequestURI();

		if (!path.contains(".")) {
			// 로그 모델 생성 및 로그 저장
			LogModel logModel = new LogModel();
			logModel.setMethod(request.getMethod());
			logModel.setPath(request.getRequestURI());
			logModel.setParams(paramString);
			logModel.setIp(ipAddress);
			logModel.setStatusCode(response.getStatus());
			logRepository.save(logModel);
			// Request 처리 전에 실행되는 메소드입니다.
			// 로그를 남기기 위한 작업을 수행합니다.
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// Request 처리 후 View를 렌더링하기 전에 실행되는 메소드입니다.
		// 로그를 남기기 위한 작업을 수행합니다.
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// View 렌더링 후 실행되는 메소드입니다.
		// 로그를 남기기 위한 작업을 수행합니다.
		String path = request.getRequestURI();

		if (!path.contains(".")) {
			LogModel logModel = new LogModel();
			logModel.setMethod(request.getMethod());
			logModel.setPath(request.getRequestURI());
			logModel.setStatusCode(response.getStatus());
			logRepository.save(logModel);
		}
	}
}
