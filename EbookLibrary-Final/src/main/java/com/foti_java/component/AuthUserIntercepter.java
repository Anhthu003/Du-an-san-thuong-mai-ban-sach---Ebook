package com.foti_java.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.foti_java.model.Account;
import com.foti_java.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthUserIntercepter implements HandlerInterceptor {
	@Autowired
	SessionService sessionService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Account account = sessionService.getAttribute("account");
		if (account != null) {
			return true;
		}
		response.sendRedirect("/login");
		return false;

	}
}
