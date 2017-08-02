package com.baozi.admin.common.annotation;

/**
 * Created by baozi on 2017/6/11.
 */

import org.springframework.stereotype.Component;

import java.lang.annotation.*;

/**
 * 标识Mybatis的dao 方便扫描
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.TYPE)
@Documented
@Component
public @interface MybatisDao {

    String value() default "";

}