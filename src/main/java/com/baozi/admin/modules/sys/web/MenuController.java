package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.BaseController;
import com.baozi.admin.common.utils.JsonResult;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.entity.Menu;
import com.baozi.admin.modules.sys.service.MenuService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by baozi on 2017/6/15.
 */
@Controller
@RequestMapping("sys/menu")
public class MenuController extends BaseController {

    @Autowired
    private MenuService menuService;

    @ModelAttribute
    public Menu get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return menuService.get(id);
        } else {
            return new Menu();
        }
    }

    @RequiresPermissions("sys:menu:view")
    @RequestMapping({"", "list"})
    public String list(Menu menu, ModelMap modelMap) {
        modelMap.addAttribute("treeMenuList", Menu.treeList(menuService.findAllList(menu), "0"));
        return "sys/menu/menuList";
    }

    @RequiresPermissions("sys:menu:view")
    @RequestMapping("form")
    public String form(Menu menu, ModelMap modelMap) {
        if (menu.getParent() == null || menu.getParent().getId() == null){
            menu.setParent(new Menu("0"));
        }
        Menu parent = menuService.get(menu.getParent().getId());
        menu.setParent(parent == null ? new Menu("0") : parent);
        // 获取排序号，最末节点排序号+10
        List<Menu> treeMenuList = new ArrayList<>();
        if (StringUtils.isBlank(menu.getId())){
            treeMenuList = Menu.treeList(menuService.findAllList(new Menu()), "0");
            if (treeMenuList.size() > 0){
                menu.setSort(treeMenuList.get(treeMenuList.size()-1).getSort() + 10);
            }
        }
        modelMap.addAttribute("menu", menu);
        modelMap.addAttribute("treeMenuList", treeMenuList);
        return "sys/menu/menuForm";
    }

    @RequiresPermissions("sys:menu:edit")
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public @ResponseBody JsonResult save(Menu menu, ModelMap modelMap) {
        if (!UserUtils.isAdmin(UserUtils.getUser().getId())) {
            return JsonResult.error(0, "越权操作，只有超级管理员才能添加或修改数据！");
        }
        if (!beanValidator(modelMap, menu)) {
            return JsonResult.error(0, modelMap.get("message").toString());
        }
        menuService.save(menu);
        return JsonResult.success(1, "添加/编辑菜单成功", menu);
    }

    @RequiresPermissions("sys:menu:delete")
    @RequestMapping("delete")
    public @ResponseBody JsonResult delete(Menu menu) {
        if (!UserUtils.isAdmin(UserUtils.getUser().getId())) {
            return JsonResult.error(0, "越权操作，只有超级管理员才能添加或修改数据！");
        }
        menuService.delete(menu);
        return JsonResult.success(1, "删除菜单成功", menu);
    }

    @RequiresPermissions("sys:menu:view")
    @RequestMapping("menuTree")
    public String menuTree(Menu menu, ModelMap modelMap) {
        modelMap.addAttribute("entity", menu);
        modelMap.addAttribute("treeList", Menu.treeList(menuService.findAllList(new Menu()), "0"));
        return "sys/treeForm";
    }

    @RequiresPermissions("sys:menu:edit")
    @RequestMapping(value = "updateSort", method = RequestMethod.POST)
    public String updateSort(String[] ids, Integer[] sorts, RedirectAttributes redirectAttributes) {
        for (int i = 0; i < ids.length; i++) {
            Menu menu = new Menu();
            menu.setId(ids[i]);
            menu.setSort(sorts[i]);
            menuService.updateSort(menu);
        }
        addMessage(redirectAttributes, "更新菜单排序成功");
        return "redirect:/sys/menu/?pageNum=1";
    }
}