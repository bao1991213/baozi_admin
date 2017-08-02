package com.baozi.admin.base;

import com.baozi.admin.base.interceptor.FreeMarkerMethodInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * Created by baozi on 2017/6/15.
 */
@Configuration
public class MyAdapter extends WebMvcConfigurerAdapter {

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("redirect:/index");
    }

    //注入自定义拦截器,用于freemarker 调用java静态工具类方法
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new FreeMarkerMethodInterceptor()).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}