package com.baozi.admin.modules.sys.entity;

import com.baozi.admin.common.TreeEntity;
import com.baozi.admin.common.utils.Global;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by baozi on 2017/6/17.
 */
public class Area extends TreeEntity<Area> {

    private String parentIds;
    private String name;
    private String type;
    private String code;

    public Area() {
        super();
    }

    public Area(String id) {
        super(id);
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public static List<Area> treeList(List<Area> list, String parentId) {
        List<Area> treeList = new ArrayList<Area>();
        list.stream().filter(menu -> menu.getParentId().equals(parentId)).forEach(menu -> {
            List<Area> nodeList = treeList(list, menu.getId());
            menu.setChildrens(nodeList);
            treeList.add(menu);
        });
        return treeList;
    }
}