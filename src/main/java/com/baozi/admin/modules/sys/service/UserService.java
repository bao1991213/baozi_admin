package com.baozi.admin.modules.sys.service;

import com.baozi.admin.common.BaseService;
import com.baozi.admin.common.ServiceException;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.dao.UserDao;
import com.baozi.admin.modules.sys.entity.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@Service
@Transactional(readOnly = true)
public class UserService extends BaseService<UserDao, User> {

    public User getByLoginName(String loginName) {
        return dao.getByLoginName(loginName);
    }

    @Transactional(readOnly = false)
    public void updatePasswordById(String id, String loginName, String newPassword) {
        User user = new User(id);
        user.setPassword(UserUtils.entryptPassword(newPassword));
        dao.updatePasswordById(user);
        // 清除用户缓存
        user.setLoginName(loginName);
        UserUtils.clearCache(user);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void save(User user) {
        if (user.isNewRecord()) {
            user.preInsert();
            dao.insert(user);
        } else {
            user.preUpdate();
            dao.update(user);
        }
        if (StringUtils.isNotBlank(user.getId())) {
            // 更新用户与角色关联
            dao.deleteUserRole(user.getId());
            if (user.getRoleList() != null && user.getRoleList().size() > 0) {
                dao.insertUserRole(user);
            } else {
                throw new ServiceException(user.getLoginName() + "没有设置角色");
            }
        }
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public int delete(User user) {
        // 清除用户缓存
        UserUtils.clearCache(user);
        dao.deleteUserRole(user.getId());
        return dao.delete(user.getId());
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void deleteIds(List<String> ids) {
        dao.deleteUserRoleIds(ids);
        dao.deleteIds(ids);
    }

    @Transactional(readOnly = false)
    public void updateStatus(User user) {
        dao.updateStatus(user);
    }

    @Transactional(readOnly = false)
    public void updateUserLoginInfo(User user) {
        dao.updateUserLoginInfo(user);
    }
}