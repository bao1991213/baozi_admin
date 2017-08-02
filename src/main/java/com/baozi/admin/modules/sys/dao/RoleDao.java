package com.baozi.admin.modules.sys.dao;

import com.baozi.admin.common.BaseDao;
import com.baozi.admin.common.annotation.MybatisDao;
import com.baozi.admin.modules.sys.entity.Role;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@MybatisDao
public interface RoleDao extends BaseDao<Role> {

    List<Role> findListByUserId(String userId);

    void deleteRoleMenu(Role role);

    void insertRoleMenu(Role role);

    List<String> findMenuIdList(Role role);
}