package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.BaseController;
import com.baozi.admin.common.utils.JsonResult;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.modules.sys.entity.Log;
import com.baozi.admin.modules.sys.service.LogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * Created by baozi on 2017/6/18.
 */

@Controller
@RequestMapping("sys/log")
public class LogController extends BaseController {

    @Autowired
    private LogService logService;

    @ModelAttribute
    public Log get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return logService.get(id);
        } else {
            return new Log();
        }
    }

    @RequiresPermissions("sys:log:view")
    @RequestMapping({"", "list"})
    public String list(Log log, ModelMap modelMap) {
        modelMap.addAttribute("log", log);
        modelMap.addAttribute("pageInfo", logService.findList(log));
        return "sys/log/logList";
    }

    @RequiresPermissions("sys:log:view")
    @RequestMapping("form")
    public String form(Log log, ModelMap modelMap) {
        modelMap.addAttribute("log", log);
        return "sys/log/logForm";
    }

    @RequiresPermissions("sys:log:delete")
    @RequestMapping("deleteIds")
    public @ResponseBody JsonResult deleteIds(String[] ids) {
        List<String> idList = Arrays.asList(ids);
        logService.deleteIds(idList);
        return JsonResult.success(1, "批量删除日志成功,数量:" + ids.length, null);
    }
}