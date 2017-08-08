<#include "/layout/base.ftl">
<@header title="菜单列表">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/lib/treeTable/themes/vsStyle/treeTable.css" />
</@header>

<#-- 树结构数据-平铺  宏定义-->
<#macro buildTree list>
    <#if list?? && list?size gt 0>
        <#list list as child>
            <tr id="${child.id}" pId="${child.parentId}">
                <td><i class="Hui-iconfont ${child.icon?default('')}"></i>${child.name}</td>
                <td>${child.href?default('')}</td>
                <td>
                    <div class="text-c">
                        <input type="hidden" class="input-text radius" style="width: 50px;margin:0;padding:0;text-align:center;" name="ids" value="${child.id}">
                        <input class="input-text radius" style="width: 50px;margin:0;padding:0;text-align:center;" name="sorts" value="${child.sort}">
                    </div>
                </td>
                <td class="td-status">${dictUtils.getDictLabel('${child.isShow}', 'show_hide', '类型错误')}</td>
                <td>${child.permission?default('')}</td>
                <td class="td-manage">
                    <a title="编辑" href="javascript:;" onclick="data_form('编辑菜单', '${request.contextPath}/sys/menu/form?id=${child.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>
                    <a title="删除" href="javascript:;" onclick="data_del(this, '${request.contextPath}/sys/menu/delete?id=${child.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>
                    <a title="添加下级菜单" href="javascript:;" onclick="data_form('添加菜单', '${request.contextPath}/sys/menu/form?parent.id=${child.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-add"></i></a>
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
    <#if message??>
        <div class="Huialert Huialert-info"><i class="Hui-iconfont Hui-iconfont-close"></i>${message}</div>
    </#if>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="data_form('添加菜单','${request.contextPath}/sys/menu/form')" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加菜单</a>
            <a href="javascript:;" onclick="updateSort('${request.contextPath}/sys/menu/updateSort')" class="btn btn-primary redius"><i class="Hui-iconfont Hui-iconfont-huanyipi"></i> 更新排序</a>
        </span>
    </div>
    <div class="mt-20">
        <form id="listForm" method="post">
            <table id="treeTable" class="table table-border table-bordered table-hover table-bg table-sort">
                <thead>
                <tr class="text-c">
                    <th>名称</th>
                    <th>链接</th>
                    <th>排序</th>
                    <th>可见</th>
                    <th>权限标识</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                    <@buildTree list=treeMenuList/>
                </tbody>
            </table>
        </form>
    </div>
</div>
<@footer>
    <script type="text/javascript" src="${request.contextPath}/static/lib/treeTable/jquery.treeTable.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#treeTable").treeTable({expandLevel : 1}).show();
        });

        function updateSort(url){
            layer.open({
                content: '正在更新排序，请稍等...'
            });
            $('#listForm').attr('action', url);
            $('#listForm').submit();
        }
    </script>
</@footer>