package com.foti_java.config;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import jakarta.servlet.Filter;

@Configuration
public class SitemeshConfig {
	@Bean
	public FilterRegistrationBean<Filter> sitemeshFilter() {
		FilterRegistrationBean<Filter> filter = new FilterRegistrationBean<Filter>();
		filter.setFilter(new ConfigurableSiteMeshFilter() {
			@Override
			protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
				builder.addDecoratorPath("/user/*", "/web.jsp").addDecoratorPath("/seller/*", "/seller.jsp")
						.addDecoratorPath("/admin/*", "/admin.jsp").addExcludedPath("/api/*");
			}
		});
		return filter;
	}
}
