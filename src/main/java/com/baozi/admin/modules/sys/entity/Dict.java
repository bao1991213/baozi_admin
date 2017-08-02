package com.baozi.admin.modules.sys.entity;

import com.baozi.admin.common.BaseEntity;

/**
 * Created by baozi on 2017/6/14.
 */
public class Dict extends BaseEntity<Dict> {

    private String value;
    private String label;
    private String type;
    private Integer sort;
    private String description;

    public Dict() {
        super();
    }

    public Dict(String id) {
        super(id);
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}