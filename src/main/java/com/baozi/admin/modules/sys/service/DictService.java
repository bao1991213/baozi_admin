package com.baozi.admin.modules.sys.service;

import com.baozi.admin.common.BaseService;
import com.baozi.admin.common.utils.CacheUtils;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.modules.sys.dao.DictDao;
import com.baozi.admin.modules.sys.entity.Dict;
import com.baozi.admin.modules.sys.utils.DictUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by baozi on 2017/6/14.
 */
@Service
@Transactional(readOnly = true)
public class DictService extends BaseService<DictDao, Dict> {

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void save(Dict entity) {
        // 保存或更新实体
        if (StringUtils.isBlank(entity.getId())){
            entity.preInsert();
            dao.insert(entity);
        }else{
            entity.preUpdate();
            dao.update(entity);
        }
        // 清除字典缓存
        CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public int delete(String id) {
        CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
        return super.delete(id);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void deleteIds(List<String> ids) {
        dao.deleteIds(ids);
        CacheUtils.remove(DictUtils.CACHE_DICT_MAP);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void updateSort(Dict dict) {
        dao.updateSort(dict);
    }
}