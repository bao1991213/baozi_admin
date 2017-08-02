package com.baozi.admin.modules.sys.dao;

import com.baozi.admin.common.BaseDao;
import com.baozi.admin.common.annotation.MybatisDao;
import com.baozi.admin.modules.sys.entity.Dict;

import java.util.List;

/**
 * Created by admin on 2017/6/14.
 */
@MybatisDao
public interface DictDao extends BaseDao<Dict> {

    List<Dict> findDescriptionList();

    void updateSort(Dict dict);
}