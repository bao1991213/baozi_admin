<#include "/layout/base.ftl">
<@header title="角色列表">

</@header>
<nav class="breadcrumb">
    <a id="btn-refresh" class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont Hui-iconfont-huanyipi"></i></a>
</nav>
<div class="page-container">
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="data_form('添加角色','${request.contextPath}/sys/role/form')" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加角色</a>
        </span>
    </div>
    <div class="mt-20">
        <table id="dataTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th>名称</th>
                <th>启用状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
                <#list roleList as role>
                    <tr class="text-c">
                        <td>${role.name}</td>
                        <td class="td-status">${dictUtils.getDictLabel('${role.useable}', 'yes_no_span', '类型错误')}</td>
                        <td class="td-manage">
                            <a title="编辑" href="javascript:;" onclick="data_form('编辑角色', '${request.contextPath}/sys/role/form?id=${role.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>
                            <a title="删除" href="javascript:;" onclick="data_del(this, '${request.contextPath}/sys/role/delete?id=${role.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
</div>
<@footer>
</@footer>