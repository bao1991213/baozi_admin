package com.baozi.admin.modules.sys.service;

import com.baozi.admin.common.TreeService;
import com.baozi.admin.common.utils.CacheUtils;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.dao.AreaDao;
import com.baozi.admin.modules.sys.entity.Area;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@Service
@Transactional(readOnly = true)
public class AreaService extends TreeService<AreaDao, Area> {

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void save(Area entity) {
        // 获取父节点实体
        if (!entity.getParentId().equals("0")) {
            entity.setParent(dao.get(entity.getParentId()));
        } else {
            entity.setParent(new Area("0"));
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
        Area area1 = new Area();
        area1.setParentIds("%," + entity.getId() + ",%");
        List<Area> list = dao.findByParentIdsLike(area1);
        for (Area area : list){
            area.setParentIds(area.getParentIds().replace(oldParentIds, entity.getParentIds()));
            dao.updateParentIds(area);
        }
        // 清除区域缓存
        CacheUtils.remove(UserUtils.CACHE_AREA_LIST);
    }

    public int delete(String id) {
        CacheUtils.remove(UserUtils.CACHE_AREA_LIST);
        return dao.delete(id);
    }
}