package com.baozi.admin.modules.sys.service;

import com.baozi.admin.common.BaseService;
import com.baozi.admin.modules.sys.dao.LogDao;
import com.baozi.admin.modules.sys.entity.Log;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by baozi on 2017/6/18.
 */

@Service
@Transactional(readOnly = true)
public class LogService extends BaseService<LogDao, Log> {

}