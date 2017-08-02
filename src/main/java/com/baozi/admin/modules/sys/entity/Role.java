package com.baozi.admin.modules.sys.entity;

import com.baozi.admin.common.BaseEntity;
import com.baozi.admin.common.utils.Global;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by baozi on 2017/6/11.
 */
public class Role extends BaseEntity<Role> {

    private String name;
    private String useable;

    private User user;
    private List<Menu> menuList = new ArrayList<>();

    public Role() {
        super();
        this.useable = Global.YES;
    }

    public Role(User user) {
        this();
        this.user = user;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUseable() {
        return useable;
    }

    public void setUseable(String useable) {
        this.useable = useable;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }

    public List<String> getMenuIdList() {
        List<String> menuIdList = menuList.stream().map(Menu::getId).collect(Collectors.toList());
        return menuIdList;
    }

    public void setMenuIdList(List<String> menuIdList) {
        menuList = new ArrayList<>();
        for (String menuId : menuIdList) {
            Menu menu = new Menu();
            menu.setId(menuId);
            menuList.add(menu);
        }
    }
}