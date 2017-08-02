package com.baozi.admin.modules.sys.service;

import com.baozi.admin.common.TreeService;
import com.baozi.admin.common.utils.CacheUtils;
import com.baozi.admin.common.utils.LogUtils;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.dao.MenuDao;
import com.baozi.admin.modules.sys.entity.Menu;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@Service
@Transactional(readOnly = true)
public class MenuService extends TreeService<MenuDao, Menu> {

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void save(Menu entity) {
        // 获取父节点实体
        if (!entity.getParentId().equals("0")) {
            entity.setParent(dao.get(entity.getParentId()));
        } else {
            entity.setParent(new Menu("0"));
        }
        // 获取修改前的parentIds，用于更新子节点的parentIds
        String oldParentIds = entity.getParentIds();
        // 设置新的父节点串
        entity.setParentIds(entity.getParent() == null ? entity.getParentId() : entity.getParent().getParentIds() + entity.getParent().getId() + ",");
        // 保存或更新实体
        if (StringUtils.isBlank(entity.getId())){
            entity.preInsert();
            dao.insert(entity);
        }else{
            entity.preUpdate();
            dao.update(entity);
        }
        // 更新子节点 parentIds
        Menu menu1 = new Menu();
        menu1.setParentIds("%," + entity.getId() + ",%");
        List<Menu> list = dao.findByParentIdsLike(menu1);
        for (Menu menu : list){
            menu.setParentIds(menu.getParentIds().replace(oldParentIds, entity.getParentIds()));
            dao.updateParentIds(menu);
        }
        // 清除用户菜单缓存
        CacheUtils.remove(UserUtils.CACHE_MENU_LIST);
//		// 清除权限缓存
//		systemRealm.clearAllCachedAuthorizationInfo();
        // 清除日志相关缓存
        CacheUtils.remove(LogUtils.CACHE_MENU_NAME_PATH_MAP);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void delete(Menu menu) {
        dao.delete(menu.getId());
        // 清除用户菜单缓存
        CacheUtils.remove(UserUtils.CACHE_MENU_LIST);
//		// 清除权限缓存
//		systemRealm.clearAllCachedAuthorizationInfo();
        // 清除日志相关缓存
        CacheUtils.remove(LogUtils.CACHE_MENU_NAME_PATH_MAP);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void updateSort(Menu menu) {
        dao.updateSort(menu);
    }
}