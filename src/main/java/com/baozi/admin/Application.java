package com.baozi.admin;

import com.baozi.admin.common.servlet.ValidateCodeServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;

// 打包成war,放置tomcat内方式

@SpringBootApplication
@EnableAutoConfiguration
@EnableCaching
public class Application extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(Application.class);
	}


	@Bean
	public ServletRegistrationBean servletRegistrationBean() {
		return new ServletRegistrationBean(new ValidateCodeServlet(), "/validateCodeServlet");
	}

	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {
		return new EmbeddedServletContainerCustomizer() {
			@Override
			public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, "/error/403"));
				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error/404"));
				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/500"));
				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(Throwable.class, "/error/500"));
			}
		};
	}

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}

}

// 标准jar执行方式
//@SpringBootApplication
//@EnableAutoConfiguration
//@EnableCaching
//public class Application {
//
//	@Bean
//	public ServletRegistrationBean servletRegistrationBean() {
//		return new ServletRegistrationBean(new ValidateCodeServlet(), "/validateCodeServlet");
//	}
//
//	@Bean
//	public EmbeddedServletContainerCustomizer containerCustomizer() {
//		return new EmbeddedServletContainerCustomizer() {
//			@Override
//			public void customize(ConfigurableEmbeddedServletContainer configurableEmbeddedServletContainer) {
//				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.FORBIDDEN, "/error/403"));
//				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND, "/error/404"));
//				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/error/500"));
//				configurableEmbeddedServletContainer.addErrorPages(new ErrorPage(Throwable.class, "/error/500"));
//			}
//		};
//	}
//
//	public static void main(String[] args) {
//		SpringApplication.run(Application.class, args);
//	}
//}