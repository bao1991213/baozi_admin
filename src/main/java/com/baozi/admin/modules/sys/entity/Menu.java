package com.baozi.admin.modules.sys.entity;

import com.baozi.admin.common.TreeEntity;
import com.baozi.admin.common.utils.Global;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
public class Menu extends TreeEntity<Menu> {

    private String parentIds;
    private String name;
    private String href;
    private String icon;
    private String isShow;
    private String permission;

    private String userId;

    public Menu() {
        super();
        this.isShow = Global.YES;
    }

    public Menu(String id) {
        super(id);
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    @NotNull(message = "名称不能为空")
    @Length(min = 1, max = 100, message = "名称长度在1-100之间")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    @NotNull(message = "是否显示不能为空")
    @Length(min = 1, max = 11, message = "长度为1")
    public String getIsShow() {
        return isShow;
    }

    public void setIsShow(String isShow) {
        this.isShow = isShow;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public static List<Menu> treeList(List<Menu> list, String parentId) {
        List<Menu> treeList = new ArrayList<Menu>();
        list.stream().filter(menu -> menu.getParentId().equals(parentId)).forEach(menu -> {
            List<Menu> nodeList = treeList(list, menu.getId());
            menu.setChildrens(nodeList);
            treeList.add(menu);
        });
        return treeList;
    }
}