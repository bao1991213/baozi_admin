package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by baozi on 2017/6/16.
 */

@Controller
@RequestMapping("sys/tag")
public class TagController extends BaseController {

    @RequiresPermissions("user")
    @RequestMapping("iconSelect")
    public String iconSelect() {
        return "sys/tagIconSelect";
    }
}