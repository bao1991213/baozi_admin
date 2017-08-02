package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.BaseController;
import com.baozi.admin.common.utils.JsonResult;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.entity.Dict;
import com.baozi.admin.modules.sys.service.DictService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Arrays;
import java.util.List;

/**
 * Created by baozi on 2017/6/17.
 */
@Controller
@RequestMapping("sys/dict")
public class DictController extends BaseController {

    @Autowired
    private DictService dictService;

    @ModelAttribute
    public Dict get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return dictService.get(id);
        } else {
            return new Dict();
        }
    }

    @RequiresPermissions("sys:dict:view")
    @RequestMapping({"", "list"})
    public String list(Dict dict, ModelMap modelMap) {
        modelMap.addAttribute("dict", dict);
        modelMap.addAttribute("pageInfo", dictService.findList(dict));
        return "sys/dict/dictList";
    }

    @RequiresPermissions("sys:dict:view")
    @RequestMapping("form")
    public String form(Dict dict, ModelMap modelMap) {
        modelMap.addAttribute("dict", dict);
        return "sys/dict/dictForm";
    }

    @RequiresPermissions("sys:dict:edit")
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public @ResponseBody JsonResult save(Dict dict, ModelMap modelMap) {
        if (!beanValidator(modelMap, dict)) {
            return JsonResult.error(0, modelMap.get("message").toString());
        }
        Dict checkDict = new Dict();
        checkDict.setValue(dict.getValue());
        checkDict.setType(dict.getType());
        checkDict = dictService.getByEntity(checkDict);
        if (checkDict != null && !dict.getId().equals(checkDict.getId())) {
            JsonResult.error(0, "当前存在重复的字典");
        }
        dictService.save(dict);
        return JsonResult.success(1, "添加/编辑字典成功", dict);
    }

    @RequiresPermissions("sys:dict:delete")
    @RequestMapping("delete")
    public @ResponseBody JsonResult delete(Dict dict) {
        dictService.delete(dict.getId());
        return JsonResult.success(1, "删除字典成功", dict);
    }

    @RequiresPermissions("sys:dict:delete")
    @RequestMapping("deleteIds")
    public @ResponseBody JsonResult deleteIds(String[] ids) {
        List<String> idList = Arrays.asList(ids);
        dictService.deleteIds(idList);
        return JsonResult.success(1, "批量删除字典成功,数量:" + ids.length, null);
    }
    @RequiresPermissions("sys:dict:edit")
    @RequestMapping(value = "updateSort", method = RequestMethod.POST)
    public String updateSort(String[] ids, Integer[] sorts, RedirectAttributes redirectAttributes) {
        for (int i = 0; i < ids.length; i++) {
            Dict dict = new Dict();
            dict.setId(ids[i]);
            dict.setSort(sorts[i]);
            dictService.updateSort(dict);
        }
        addMessage(redirectAttributes, "更新字典排序成功");
        return "redirect:/sys/dict/?pageNum=1";
    }
}