package com.baozi.admin.modules.sys.utils;

import com.baozi.admin.base.SpringUtils;
import com.baozi.admin.common.utils.CacheUtils;
import com.baozi.admin.common.utils.StringUtils;
import com.baozi.admin.modules.sys.dao.DictDao;
import com.baozi.admin.modules.sys.entity.Dict;
import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;

import java.util.*;

/**
 * Created by baozi on 2017/6/18.
 */
public class DictUtils {

    private static DictDao dictDao = SpringUtils.getBean(DictDao.class);

    public static final String CACHE_DICT_MAP = "dictMap";
    public static final String CACHE_DICT_TYPE_LIST = "dictTypeList";

    public static String getDictLabel(String value, String type, String defaultValue) {
        if (StringUtils.isNotBlank(type) && StringUtils.isNotBlank(value)) {
            for (Dict dict : getDictList(type)) {
                if (type.equals(dict.getType()) && value.equals(dict.getValue())) {
                    return dict.getLabel();
                }
            }
        }
        return defaultValue;
    }

    public static List<Dict> getDictList(String type) {
        @SuppressWarnings("unchecked")
        Map<String, List<Dict>> dictMap = (Map<String, List<Dict>>) CacheUtils.get(CACHE_DICT_MAP);
        if (dictMap == null) {
            dictMap = new HashMap<String, List<Dict>>();
            for (Dict dict : dictDao.findList(new Dict())) {
                List<Dict> dictList = dictMap.get(dict.getType());
                if (dictList != null) {
                    dictList.add(dict);
                } else {
                    dictMap.put(dict.getType(), new ArrayList<>(Arrays.asList(dict)));
                }
            }
            CacheUtils.put(CACHE_DICT_MAP, dictMap);
        }
        List<Dict> dictList = dictMap.get(type);
        if (dictList == null) {
            dictList = new ArrayList<>();
        }
        return dictList;
    }

    public static List<Dict> getDictTypeList() {
        @SuppressWarnings("unchecked")
        List<Dict> cacheList = (List<Dict>) CacheUtils.get(CACHE_DICT_TYPE_LIST);
        if (cacheList != null) {
            return cacheList;
        }
        List<Dict> typeList = dictDao.findDescriptionList();
        if (typeList.size() != 0) {
            CacheUtils.put(CACHE_DICT_TYPE_LIST, typeList);
        }
        return typeList;
    }
}