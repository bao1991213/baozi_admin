package com.baozi.admin.common;

import com.fasterxml.jackson.annotation.JsonBackReference;

import javax.validation.constraints.NotNull;
import java.util.List;

/**
 * Created by baozi on 2017/6/13.
 */
public class TreeEntity<T> extends BaseEntity {

    private String parentId;
    private Integer sort;

    private T parent;
    private List<T> childrens;

    public TreeEntity() {
        super();
    }

    public TreeEntity(String id) {
        this();
        super.setId(id);
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public List<T> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<T> childrens) {
        this.childrens = childrens;
    }

    @JsonBackReference
    public T getParent() {
        return parent;
    }

    public void setParent(T parent) {
        this.parent = parent;
    }
}