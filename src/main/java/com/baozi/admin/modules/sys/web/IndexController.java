package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.entity.Menu;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by baozi on 2017/6/15.
 */
@Controller
@RequestMapping("index")
public class IndexController {

    @RequestMapping("")
    @RequiresPermissions("user")
    public String index(ModelMap modelMap) {
        List<Menu> treeList = Menu.treeList(UserUtils.getMenuList(), "0");
        modelMap.addAttribute("treeMenuList", treeList);
        modelMap.addAttribute("user", UserUtils.getUser());
        return "sys/index";
    }

    @RequestMapping("welcome")
    @RequiresPermissions("user")
    public String welcome() {
        return "sys/welcome";
    }
}