package com.baozi.admin.modules.sys.dao;

import com.baozi.admin.common.TreeDao;
import com.baozi.admin.common.annotation.MybatisDao;
import com.baozi.admin.modules.sys.entity.Area;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@MybatisDao
public interface AreaDao extends TreeDao<Area> {

    List<Area> findByParentIdsLike(Area area);

    void updateParentIds(Area area);
}