package com.foti_java.component;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.foti_java.model.Account;
import com.foti_java.model.RoleDetail;
import com.foti_java.repository.AccountRepositoty;
import com.foti_java.repository.RoleDetailRepository;
import com.foti_java.service.SessionService;

import jakarta.mail.Session;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class AuthSellerIntercepter implements HandlerInterceptor {
	@Autowired
	SessionService sessionService;
	@Autowired
	RoleDetailRepository roleDetailRepository;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		try {
			Account account = sessionService.getAttribute("account");
			System.out.println(account.getFullname());
			if (account != null) {
				for (RoleDetail roleDetail : roleDetailRepository.findByAccount(account.getId())) {
					if (roleDetail.getRole().getName().equalsIgnoreCase("seller")
							|| roleDetail.getRole().getName().equalsIgnoreCase("admin")) {
						return true;
					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		response.sendRedirect("/login");
		return false;
	}
}
