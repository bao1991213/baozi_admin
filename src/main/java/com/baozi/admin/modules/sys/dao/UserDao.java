package com.baozi.admin.modules.sys.dao;

import com.baozi.admin.common.BaseDao;
import com.baozi.admin.common.annotation.MybatisDao;
import com.baozi.admin.modules.sys.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */

@MybatisDao
public interface UserDao extends BaseDao<User> {

    User getByLoginName(String loginName);

    void updatePasswordById(User user);

    void deleteUserRole(String id);

    void deleteUserRoleIds(List<String> ids);

    void updateStatus(User user);

    void updateUserLoginInfo(User user);

    void insertUserRole(User user);
}