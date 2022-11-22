package com.springboot.mycgv.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.springboot.mycgv.dto.SessionDto;

public class AutoInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		SessionDto svo = (SessionDto) session.getAttribute("svo");
		
		if(svo == null) {
			response.sendRedirect("http://localhost:9000/login");
			return false;
		}
		
		return true;
	}
}
