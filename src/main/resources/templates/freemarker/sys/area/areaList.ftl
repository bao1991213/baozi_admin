<#include "/layout/base.ftl">
<@header title="区域列表">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/lib/treeTable/themes/vsStyle/treeTable.css" />
</@header>

<#-- 树结构数据-平铺  宏定义-->
<#macro buildTree list>
    <#if list?? && list?size gt 0>
        <#list list as child>
            <tr id="${child.id}" pId="${child.parentId}">
                <td>${child.name}</td>
                <td>${child.code?default('')}</td>
                <td class="td-status">${dictUtils.getDictLabel('${child.type}', 'area_type', '类型错误')}</td>
                <td class="td-manage">
                    <a title="编辑" href="javascript:;" onclick="data_form('编辑区域', '${request.contextPath}/sys/area/form?id=${child.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>
                    <a title="删除" href="javascript:;" onclick="data_del(this, '${request.contextPath}/sys/area/delete?id=${child.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>
                    <a title="添加下级区域" href="javascript:;" onclick="data_form('添加区域', '${request.contextPath}/sys/area/form?parent.id=${child.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-add"></i></a>
                </td>
            </tr>
            <#if child.childrens?? && child.childrens?size gt 0>
                <@buildTree list=child.childrens />
            </#if>
        </#list>
    </#if>
</#macro>
<nav class="breadcrumb">
    <a id="btn-refresh" class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont Hui-iconfont-huanyipi"></i></a>
</nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="data_form('添加区域','${request.contextPath}/sys/area/form')" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加区域</a>
        </span>
    </div>
    <div class="mt-20">
        <table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th>名称</th>
                <th>邮编</th>
                <th>类型</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <@buildTree list=treeMenuList/>
            </tbody>
        </table>
    </div>
</div>
<@footer>
<script type="text/javascript" src="${request.contextPath}/static/lib/treeTable/jquery.treeTable.js"></script>
<script type="text/javascript">
    $(function(){
        $("#treeTable").treeTable({expandLevel : 1}).show();
    });
</script>
</@footer>