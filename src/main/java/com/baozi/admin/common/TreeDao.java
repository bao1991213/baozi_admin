package com.baozi.admin.common;

import java.util.List;

/**
 * Created by baozi on 2017/6/13.
 */
public interface TreeDao<T> {

    T get(String id);

    T getByEntity(T entity);

    List<T> findList(T entity);

    int insert(T entity);

    int update(T entity);

    int delete(String id);

}