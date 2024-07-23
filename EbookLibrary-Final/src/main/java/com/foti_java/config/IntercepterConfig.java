package com.foti_java.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.foti_java.component.AuthAdminIntercepter;
import com.foti_java.component.AuthSellerIntercepter;
import com.foti_java.component.AuthUserIntercepter;

@Configuration
public class IntercepterConfig implements WebMvcConfigurer {
	@Autowired
	AuthUserIntercepter authUserIntercepter;
	@Autowired
	AuthSellerIntercepter authSellerIntercepter;
	@Autowired
	AuthAdminIntercepter authAdminIntercepter;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authUserIntercepter).addPathPatterns("/user/**");
		registry.addInterceptor(authSellerIntercepter).addPathPatterns("/seller/**");
		registry.addInterceptor(authAdminIntercepter).addPathPatterns("/admin/**");
	}
}
