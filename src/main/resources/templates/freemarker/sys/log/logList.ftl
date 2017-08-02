<#include "/layout/base.ftl">
<@header title="日志列表">

</@header>
<nav class="breadcrumb">
    <a id="btn-refresh" class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont Hui-iconfont-huanyipi"></i></a>
</nav>
<div class="page-container">
    <form id="searchForm" class="form form-horizontal" action="${request.contextPath}/sys/log">
        <input id="pageNum" name="pageNum" type="hidden" value="${pageInfo.pageNum}">
        <div class="text-c"> 日期范围：
            <input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin"
                   class="input-text radius size-M Wdate" style="width:120px;" id="beginDate" name="beginDate" value="${log.beginDate?default('')}">
            -
            <input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax"
                   class="input-text radius size-M Wdate" style="width:120px;" id="endDate" name="endDate" value="${log.endDate?default('')}">
            <input type="text" class="input-text radius size-M" style="width:150px" placeholder="输入操作菜单" id="title" name="title" value="${log.title?default('')}">
            <input type="text" class="input-text radius size-M" style="width:150px" placeholder="输入操作用户" id="createBy.name" name="createBy.name" value="<#if log.createBy??>${log.createBy.name?default('')}</#if>">
            <button type="submit" class="btn btn-success radius"><i class="Hui-iconfont Hui-iconfont-search2"></i> 搜索</button>
        </div>
    </form>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="dataDel('${request.contextPath}/sys/log/deleteIds?ids=')" class="btn btn-danger radius"><i class="Hui-iconfont Hui-iconfont-del3"></i> 批量删除</a>
        </span>
        <span class="r">当前分页大小：<strong>${pageInfo.pageSize}</strong>，共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <div class="mt-20">
        <table id="dataTable" class="table table-border table-bordered table-hover table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="25"><input type="checkbox" name="" value=""></th>
                <th>操作菜单</th>
                <th>操作用户</th>
                <th>URI</th>
                <th>提交方式</th>
                <th>操作IP</th>
                <th>操作时间</th>
            </tr>
            </thead>
            <tbody>
            <#list pageInfo.list as log>
            <tr class="text-c">
                <td><input type="checkbox" value="${log.id?default('')}" name="id"></td>
                <td><a href="javascript:;" onclick="layer_show('日志详情', '${request.contextPath}/sys/log/form?id=${log.id}', 440, 400)">${log.title?default('')}</a></td>
                <td>${log.createBy.name?default('')}</td>
                <td>${log.requestUri?default('')}</td>
                <td>${log.method?default('')}</td>
                <td>${log.remoteAddr?default('')}</td>
                <td><#if log.createDate??>${log.createDate?datetime}</#if></td>
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
</script>
</@footer>