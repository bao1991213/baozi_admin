package com.baozi.admin.modules.sys.web;

import com.baozi.admin.common.BaseController;
import com.baozi.admin.common.utils.JsonResult;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.entity.Role;
import com.baozi.admin.modules.sys.entity.User;
import com.baozi.admin.modules.sys.service.UserService;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by baozi on 2017/6/11.
 */
@Controller
@RequestMapping("sys/user")
public class UserController extends BaseController {

    @Autowired
    private UserService userService;

    @ModelAttribute
    public User get(@RequestParam(required = false) String id) {
        if (StringUtils.isNotBlank(id)) {
            return UserUtils.get(id);
        } else {
            return new User();
        }
    }

    @RequiresPermissions("user")
    @RequestMapping("modifyPwdForm")
    public String modifyPwdForm(User user, ModelMap modelMap) {
        modelMap.addAttribute("user", user);
        return "sys/user/modifyPwd";
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "modifyPwd", method = RequestMethod.POST)
    public @ResponseBody JsonResult modifyPwd(String oldPassword, String newPassword) {
        User user = UserUtils.getUser();
        if (StringUtils.isNotBlank(oldPassword) && StringUtils.isNotBlank(newPassword)) {
            if (UserUtils.validatePassword(oldPassword, user.getPassword())) {
                userService.updatePasswordById(user.getId(), user.getLoginName(), newPassword);
                return JsonResult.success(1, "修改密码成功", user);
            } else {
                return JsonResult.error(0, "修改密码失败,旧密码错误");
            }
        }
        return JsonResult.error(0, "参数错误");
    }

    @RequiresPermissions("user")
    @RequestMapping("modifyUserForm")
    public String modifyUserForm(User user, ModelMap modelMap) {
        modelMap.addAttribute("user", user);
        return "sys/user/modifyUser";
    }

    @RequiresPermissions("user")
    @RequestMapping(value = "modifyUser", method = RequestMethod.POST)
    public @ResponseBody JsonResult modifyUser(User user) {
        if (StringUtils.isNotBlank(user.getLoginName()) && StringUtils.isNotBlank(user.getNo()) &&
                StringUtils.isNotBlank(user.getName()) && user.getPage() != null) {
            userService.save(user);
            return JsonResult.success(1, "修改信息成功", user);
        }
        return JsonResult.error(0, "参数错误");
    }

    @RequiresPermissions("sys:user:view")
    @RequestMapping(value = {"", "userList"})
    public String userList(User user, ModelMap modelMap) {
        PageInfo<User> pageInfo = userService.findList(user);
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("pageInfo", pageInfo);
        return "sys/user/userList";
    }

    @RequiresPermissions("sys:user:view")
    @RequestMapping("form")
    public String form(User user, ModelMap modelMap) {
        modelMap.addAttribute("user", user);
        modelMap.addAttribute("roleList", UserUtils.getRoleList(null));
        return "sys/user/userForm";
    }

    @RequiresPermissions("sys:user:edit")
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public @ResponseBody JsonResult save(User user, String[] roleIds, ModelMap modelMap) {
        if (StringUtils.isNotBlank(user.getNewPassword())) {
            user.setPassword(UserUtils.entryptPassword(user.getNewPassword()));
        }
        if (!beanValidator(modelMap, user)) {
            return JsonResult.error(0, modelMap.get("message").toString());
        }
        if (user.isNewRecord() && StringUtils.isBlank(user.getPassword())) {
            return JsonResult.error(0, "添加用户必须输入初始密码");
        }
        if (roleIds == null || roleIds.length == 0) {
            return JsonResult.error(0, "用户必须选择一个角色");
        }
        User oldUser = userService.getByLoginName(user.getLoginName());
        if (user.isNewRecord() && oldUser != null) {
            return JsonResult.error(0, "登录名已存在");
        }
        // 角色数据有效性验证，过滤不在授权内的角色
        List<Role> roleList = new ArrayList<>();
        List<String> roleIdList = Arrays.asList(roleIds);
        roleList.addAll(UserUtils.getRoleList(user).stream().filter(role -> roleIdList.contains(role.getId())).collect(Collectors.toList()));
        user.setRoleList(roleList);
        userService.save(user);
        if (user.getLoginName().equals(UserUtils.getUser().getLoginName())) {
            UserUtils.clearCache(user);
        }
        return JsonResult.success(1, "添加/编辑用户成功", user);
    }

    @RequiresPermissions("sys:user:delete")
    @RequestMapping("delete")
    public @ResponseBody JsonResult delete(User user) {
        if (user.getId().equals(UserUtils.getUser().getId())) {
            return JsonResult.error(0, "删除失败,不能删除当前登录用户");
        }
        userService.delete(user);
        return JsonResult.success(1, "删除用户成功", null);
    }

    @RequiresPermissions("sys:user:delete")
    @RequestMapping("deleteIds")
    public @ResponseBody JsonResult deleteIds(String[] ids) {
        List<String> idList = Arrays.asList(ids);
        if (idList.contains(UserUtils.getUser().getId())) {
            return JsonResult.error(0, "删除失败,不能删除当前登录用户");
        }
        userService.deleteIds(idList);
        return JsonResult.success(1, "批量删除用户成功,数量:" + ids.length, null);
    }

    @RequiresPermissions("sys:user:edit")
    @RequestMapping("changeStatus")
    public @ResponseBody JsonResult changeStatus(User user) {
        if (user.isNewRecord()) {
            return JsonResult.error(0, "修改用户状态失败,用户不存在");
        }
        userService.updateStatus(user);
        return JsonResult.success(1, "修改用户状态成功", user);
    }
}