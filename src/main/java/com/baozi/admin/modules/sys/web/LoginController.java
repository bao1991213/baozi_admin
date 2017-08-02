package com.baozi.admin.modules.sys.web;

import com.baozi.admin.base.shiro.AuthRealm;
import com.baozi.admin.base.shiro.FormAuthenticationFilter;
import com.baozi.admin.common.BaseController;
import com.baozi.admin.common.servlet.ValidateCodeServlet;
import com.baozi.admin.common.utils.IdGen;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by baozi on 2017/6/12.
 */
@Controller
public class LoginController extends BaseController {

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        AuthRealm.Principal principal = UserUtils.getPrincipal();

        //如果已登录,跳转到管理首页
        if (principal != null && !principal.isMobileLogin()) {
            return "redirect:/";
        }
        return "sys/login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String loginFail(HttpServletRequest request, HttpServletResponse response, ModelMap modelMap) {
        AuthRealm.Principal principal = UserUtils.getPrincipal();

        // 如果已经登录，则跳转到管理首页
        if(principal != null){
            return "redirect:/";
        }

        String username = WebUtils.getCleanParam(request, FormAuthenticationFilter.DEFAULT_USERNAME_PARAM);
        boolean rememberMe = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM);
        boolean mobile = WebUtils.isTrue(request, FormAuthenticationFilter.DEFAULT_MOBILE_PARAM);
        String exception = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String message = (String)request.getAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM);

        if (StringUtils.isBlank(message) || StringUtils.equals(message, "null")){
            message = "用户或密码错误, 请重试.";
        }

        modelMap.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, username);
        modelMap.addAttribute(FormAuthenticationFilter.DEFAULT_REMEMBER_ME_PARAM, rememberMe);
        modelMap.addAttribute(FormAuthenticationFilter.DEFAULT_MOBILE_PARAM, mobile);
        modelMap.addAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME, exception);
        modelMap.addAttribute(FormAuthenticationFilter.DEFAULT_MESSAGE_PARAM, message);

        // 验证失败清空验证码
        request.getSession().setAttribute(ValidateCodeServlet.VALIDATE_CODE, IdGen.uuid());

        // 如果是手机登录，则返回JSON字符串
        if (mobile){
            return renderString(response, modelMap);
        }

        return "sys/login";
    }
}