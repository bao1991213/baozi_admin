package com.baozi.admin.modules.sys.entity;

import com.baozi.admin.common.BaseEntity;
import com.baozi.admin.common.utils.Global;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by baozi on 2017/6/11.
 */
public class User extends BaseEntity<User> {

    private String loginName;
    private String password;
    private String no;
    private String name;
    private String loginIp;
    private Date loginDate;
    private String loginFlag;
    private Integer page;

    private String newPassword;
    private String confirmNewPassword;
    private List<Role> roleList;

    public User() {
        super();
        this.loginFlag = Global.YES;
    }

    public User(String id){
        super(id);
    }

    @NotNull(message = "登录名不能为空")
    @Length(min = 6, max = 16, message = "登录名长度在6-16之间")
    @Pattern(regexp = Global.NAME_REGEX, message = Global.NAME_REGEX_MSG)
    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    @NotNull(message = "密码不能为空")
    @Length(min = 6, max = 100, message = "密码长度在6-100之间")
    @Pattern(regexp = Global.PWD_REGEX, message = Global.PWD_REGEX_MSG)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @NotNull(message = "工号不能为空")
    @Length(min = 4, max = 4, message = "工号长度必须是4位")
    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    @NotNull(message = "用户名不能为空")
    @Length(min = 6, max = 16, message = "用户名长度在6-16之间")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public Date getLoginDate() {
        return loginDate;
    }

    public void setLoginDate(Date loginDate) {
        this.loginDate = loginDate;
    }

    @NotNull(message = "是否允许登录不能为空")
    public String getLoginFlag() {
        return loginFlag;
    }

    public void setLoginFlag(String loginFlag) {
        this.loginFlag = loginFlag;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmNewPassword() {
        return confirmNewPassword;
    }

    public void setConfirmNewPassword(String confirmNewPassword) {
        this.confirmNewPassword = confirmNewPassword;
    }
}