<#include "/layout/base.ftl">
<@header title="用户列表">

</@header>
<nav class="breadcrumb">
    <a id="btn-refresh" class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont Hui-iconfont-huanyipi"></i></a>
</nav>
<div class="page-container">
    <form id="searchForm" class="form form-horizontal" action="${request.contextPath}/sys/user">
        <input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}">
        <div class="text-c"> 日期范围：
            <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin"
                   class="input-text radius size-M Wdate" style="width:120px;" id="beginDate" name="beginDate" value="${user.beginDate?default('')}">
            -
            <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax"
                   class="input-text radius size-M Wdate" style="width:120px;" id="endDate" name="endDate" value="${user.endDate?default('')}">
            <input type="text" class="input-text radius size-M" style="width:250px" placeholder="输入用户名 登录名" id="name" name="name" value="${user.name?default('')}">
            <button type="submit" class="btn btn-success radius"><i class="Hui-iconfont Hui-iconfont-search2"></i> 搜索</button>
        </div>
    </form>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="dataDel('${request.contextPath}/sys/user/deleteIds?ids=')" class="btn btn-danger radius"><i class="Hui-iconfont Hui-iconfont-del3"></i> 批量删除</a>
            <a href="javascript:;" onclick="data_form('添加管理员','${request.contextPath}/sys/user/form')" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加管理员</a>
        </span>
        <span class="r">当前分页大小：<strong>${pageInfo.pageSize}</strong>，共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <div class="mt-20">
        <table id="dataTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th>工号</th>
                <th>登录名</th>
                <th>用户名</th>
                <th>启用状态</th>
                <th>最后登录ip</th>
                <th>最后登录时间</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
                <#list pageInfo.list as user>
                    <tr class="text-c">
                        <td><input type="checkbox" value="${user.id}" name="id"></td>
                        <td>${user.no}</td>
                        <td>${user.loginName}</td>
                        <td>${user.name}</td>
                        <td class="td-status">${dictUtils.getDictLabel('${user.loginFlag}', 'yes_no_span', '类型错误')}</td>
                        <td>${user.loginIp?default('')}</td>
                        <td><#if user.loginDate??>${user.loginDate?datetime}</#if></td>
                        <td>${user.remarks?default('')}</td>
                        <td class="td-manage">
                            <#if user.loginFlag == '1'>
                                <a style="text-decoration:none" onClick="admin_status_change('${user.id}', '0')" href="javascript:;" title="停用"><i class="Hui-iconfont Hui-iconfont-shenhe-tingyong"></i></a>
                            <#else>
                                <a style="text-decoration:none" onClick="admin_status_change('${user.id}', '1')" href="javascript:;" title="启用"><i class="Hui-iconfont Hui-iconfont-gouxuan"></i></a>
                            </#if>
                            <a title="编辑" href="javascript:;" onclick="data_form('编辑管理员','${request.contextPath}/sys/user/form?id=${user.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>
                            <a title="删除" href="javascript:;" onclick="data_del(this, '${request.contextPath}/sys/user/delete?id=${user.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>
                        </td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
</div>
<div id="page" data-pages="${pageInfo.pages}"></div>
<@footer>
    <script type="text/javascript">
        /*批量删除*/
        function dataDel(url){
            var ids = new Array();
            $('#dataTable').find('tbody tr').each(function(){
                if ($(this).find('td').find('input').is(':checked')) {
                    ids.push($(this).find('td').find('input').val());
                }
            });
            if (ids.length > 0) {
                layer.confirm('确认要批量删除吗？', function(){
                    $.ajax({
                        type: 'GET',
                        url: url + ids,
                        dataType: 'json',
                        success: function(data){
                            layer.open({title: '提示', content: data.m, time: 2000, end: function(){
                                if (data.c == 1) {
                                    $('#dataTable').find('tbody tr').each(function(){
                                        if ($(this).find('td').find('input').is(':checked')) {
                                            $(this).remove();
                                        }
                                    });
                                    layer_close();
                                }
                            }});
                        },
                        error: function(){
                            layer.open({title: '提示', content: '系统异常,请联系技术人员'});
                        }
                    });
                });
            } else {
                layer.msg('请勾选数据', {time: 2000});
            }
        }

        /*管理员-修改状态*/
        function admin_status_change(id, loginFlag){
            $.ajax({
                type: 'GET',
                url: '${request.contextPath}/sys/user/changeStatus?id=' + id + '&loginFlag=' + loginFlag,
                success: function(data){
                    layer.open({title: '提示', content: data.m, time: 2000});
                },
                error: function(){
                    layer.open({title: '提示', content: '系统异常,请联系技术人员'});
                }
            });
        }
    </script>
</@footer>