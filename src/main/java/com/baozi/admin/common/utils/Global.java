package com.baozi.admin.common.utils;

/**
 * 全局通用静态类
 * Created by baozi on 2017/6/11.
 */
public class Global {

    public static final String ADMIN_ID = "95888888";

    public static final String NAME_REGEX = "^[a-z0-9]{6,16}$";     //name正则匹配
    public static final String NAME_REGEX_MSG = "允许输入 字母a-z,数值0-9,6-16位";
    public static final String PWD_REGEX = "^[0-9a-zA-Z]{6,100}$";   //password正则匹配
    public static final String PWD_REGEX_MSG = "允许输入 字母a-z,A-Z,数值0-9,6-100位";

    public static final String YES = "1";
    public static final String NO = "0";

    public static final String TRUE = "true";
    public static final String FALSE = "false";
}