package com.foti_java.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.foti_java.model.Account;
import com.foti_java.model.RoleDetail;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.RoleDetailRepository;
import com.foti_java.service.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthAdminIntercepter implements HandlerInterceptor {
	@Autowired
	SessionService sessionService;
	@Autowired
	RoleDetailRepository roleDetaiRepository;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Account account = sessionService.getAttribute("account");
		if (account != null) {
			for (RoleDetail roleDetail : roleDetaiRepository.findByAccount(account.getId())) {
				if (roleDetail.getRole().getName().equalsIgnoreCase("admin")) {
					return true;
				}
			}
		}
		response.sendRedirect("/login");
		return false;
	}
}
