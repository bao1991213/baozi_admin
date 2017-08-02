package com.baozi.admin.common;

import com.baozi.admin.common.utils.UserUtils;
import com.baozi.admin.modules.sys.entity.User;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by baozi on 2017/6/11.
 */
@Transactional(readOnly = true)
public abstract class BaseService<D extends BaseDao<T>, T extends BaseEntity<T>> {

    @Autowired
    protected D dao;

    public T get(String id) {
        return dao.get(id);
    }

    public T getByEntity(T entity) {
        return dao.getByEntity(entity);
    }

    public PageInfo<T> findList(T entity) {
        PageHelper.startPage(entity.getPageNum(), UserUtils.getUser().getPage());
        List<T> list = dao.findList(entity);
        PageInfo<T> pageInfo = new PageInfo<T>(list);
        return pageInfo;
    }

    public List<T> findAllList(T entity) {
        return dao.findList(entity);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void save(T entity) {
        if (entity.isNewRecord()) {
            entity.preInsert();
            dao.insert(entity);
        } else {
            entity.preUpdate();
            dao.update(entity);
        }
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public int delete(String id) {
        return dao.delete(id);
    }

    @Transactional(readOnly = false, rollbackFor = {Exception.class, RuntimeException.class})
    public void deleteIds(List<String> ids) {
        dao.deleteIds(ids);
    }
}