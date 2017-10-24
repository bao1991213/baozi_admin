package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.BaseController;
import com.baozi.admin.common.utils.JsonResult;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.entity.Menu;
import com.baozi.admin.modules.sys.entity.Role;
import com.baozi.admin.modules.sys.service.MenuService;
import com.baozi.admin.modules.sys.service.RoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * Created by baozi on 2017/6/16.
 */
@Controller
@RequestMapping("sys/role")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @ModelAttribute
    public Role get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return roleService.get(id);
        } else {
            return new Role();
        }
    }

    @RequiresPermissions("sys:role:view")
    @RequestMapping({"", "list"})
    public String list(ModelMap modelMap) {
        List<Role> roleList = UserUtils.getRoleList(UserUtils.getUser());
        modelMap.addAttribute("roleList", roleList);
        return "sys/role/roleList";
    }

    @RequiresPermissions("sys:role:view")
    @RequestMapping("form")
    public String form(Role role, ModelMap modelMap) {
        if (!role.isNewRecord()) {
            role.setMenuIdList(roleService.findMenuIdList(role));
        }
        modelMap.addAttribute("role", role);
        modelMap.addAttribute("treeMenuList", Menu.treeList(menuService.findAllList(new Menu()), "0"));
        return "sys/role/roleForm";
    }

    @RequiresPermissions("sys:role:edit")
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public @ResponseBody JsonResult save(Role role, String[] menuIds, ModelMap modelMap) {
        if (!UserUtils.isAdmin(UserUtils.getUser().getId())) {
            return JsonResult.error(0, "越权操作，只有超级管理员才能添加或修改数据！");
        }
        if (!beanValidator(modelMap, role)){
            return JsonResult.error(0, modelMap.get("message").toString());
        }
        Role oldRole = new Role();
        oldRole.setName(role.getName());
        oldRole = roleService.getByEntity(oldRole);
        if (oldRole != null) {
            JsonResult.error(0, "保存角色 (" + role.getName() + ") 失败,角色名已存在");
        }
        role.setMenuIdList(Arrays.asList(menuIds));
        roleService.save(role);
        return JsonResult.success(1, "添加/编辑角色成功", role);
    }

    @RequiresPermissions("sys:role:delete")
    @RequestMapping("delete")
    public @ResponseBody JsonResult delete(Role role) {
        if (!UserUtils.isAdmin(UserUtils.getUser().getId())) {
            return JsonResult.error(0, "越权操作，只有超级管理员才能添加或修改数据！");
        }
        roleService.delete(role.getId());
        return JsonResult.success(1, "删除角色成功", role);
    }
}