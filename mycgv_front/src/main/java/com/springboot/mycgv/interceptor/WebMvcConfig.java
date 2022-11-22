package com.springboot.mycgv.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	//해당 
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//ArrayList<String>
									//생성한 Interceptor Service 등록
		registry.addInterceptor(new AutoInterceptor())
		.excludePathPatterns("/board_list*/**", "/board_content*/**")
		.addPathPatterns("/board*/**");
		
		registry.addInterceptor(new AdminInterceptor()).addPathPatterns("/admin*/**");
	}
}
