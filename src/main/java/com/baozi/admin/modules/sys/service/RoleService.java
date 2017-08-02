package com.baozi.admin.modules.sys.service;

import com.baozi.admin.common.BaseService;
import com.baozi.admin.common.utils.CacheUtils;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.dao.RoleDao;
import com.baozi.admin.modules.sys.entity.Role;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@Service
@Transactional(readOnly = true)
public class RoleService extends BaseService<RoleDao, Role> {

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void save(Role role) {
        if (StringUtils.isBlank(role.getId())){
            role.preInsert();
            dao.insert(role);
        }else{
            role.preUpdate();
            dao.update(role);
        }

        // 更新角色与菜单关联
        dao.deleteRoleMenu(role);
        if (role.getMenuList().size() > 0){
            dao.insertRoleMenu(role);
        }

        // 清除用户角色缓存
        CacheUtils.remove(UserUtils.CACHE_ROLE_LIST);
//		// 清除权限缓存
//		systemRealm.clearAllCachedAuthorizationInfo();
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void delete(Role role) {
        dao.delete(role.getId());
        // 清除角色菜单
        dao.deleteRoleMenu(role);
        // 清除用户角色缓存
        CacheUtils.remove(UserUtils.CACHE_ROLE_LIST);
//		// 清除权限缓存
//		systemRealm.clearAllCachedAuthorizationInfo();
    }

    public List<String> findMenuIdList(Role role) {
        return dao.findMenuIdList(role);
    }
}