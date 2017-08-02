package com.baozi.admin.modules.sys.dao;

import com.baozi.admin.common.TreeDao;
import com.baozi.admin.common.annotation.MybatisDao;
import com.baozi.admin.modules.sys.entity.Menu;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@MybatisDao
public interface MenuDao extends TreeDao<Menu> {

    List<Menu> findByUserId(Menu menu);

    List<Menu> findByParentIdsLike(Menu menu);

    void updateParentIds(Menu menu);

    void updateSort(Menu menu);
}