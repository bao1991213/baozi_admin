package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.BaseController;
import com.baozi.admin.common.utils.JsonResult;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.entity.Area;
import com.baozi.admin.modules.sys.service.AreaService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

/**
 * Created by baozi on 2017/6/17.
 */
@Controller
@RequestMapping("sys/area")
public class AreaController extends BaseController {

    @Autowired
    private AreaService areaService;

    @ModelAttribute
    public Area get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return areaService.get(id);
        } else {
            return new Area();
        }
    }

    @RequiresPermissions("sys:area:view")
    @RequestMapping({"", "list"})
    public String list(ModelMap modelMap) {
        modelMap.addAttribute("treeMenuList", Area.treeList(UserUtils.getAreaList(), "0"));
        return "sys/area/areaList";
    }

    @RequiresPermissions("sys:area:view")
    @RequestMapping("form")
    public String form(Area area, ModelMap modelMap) {
        if (area.getParent() == null || area.getParent().getId() == null){
            area.setParent(new Area("0"));
        }
        Area parent = areaService.get(area.getParent().getId());
        area.setParent(parent == null ? new Area("0") : parent);
        modelMap.addAttribute("area", area);
        return "sys/area/areaForm";
    }

    @RequiresPermissions("sys:area:edit")
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public @ResponseBody JsonResult save(Area area, ModelMap modelMap) {
        if (!beanValidator(modelMap, area)) {
            return JsonResult.error(0, modelMap.get("message").toString());
        }
        areaService.save(area);
        return JsonResult.success(1, "添加/编辑区域成功", area);
    }

    @RequiresPermissions("sys:area:delete")
    @RequestMapping("delete")
    public @ResponseBody JsonResult delete(Area area) {
        areaService.delete(area.getId());
        return JsonResult.success(1, "删除区域成功", area);
    }

    @RequiresPermissions("sys:area:view")
    @RequestMapping("areaTree")
    public String menuTree(Area area, ModelMap modelMap) {
        modelMap.addAttribute("entity", area);
        modelMap.addAttribute("treeList", Area.treeList(UserUtils.getAreaList(), "0"));
        return "sys/treeForm";
    }
}