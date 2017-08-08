<#include "/layout/base.ftl">
<@header title="字典列表">

</@header>
<nav class="breadcrumb">
    <a id="btn-refresh" class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新"><i class="Hui-iconfont Hui-iconfont-huanyipi"></i></a>
</nav>
<div class="page-container">
    <form id="searchForm" class="form form-horizontal" action="${request.contextPath}/sys/dict">
        <input type="hidden" id="pageNum" name="pageNum" value="${pageInfo.pageNum}">
        <div class="text-c">
            <span class="select-box radius" style="width:150px">
                <select class="select" name="type" size="1">
                    <option value="" label="请选择">请选择</option>
                    <#list dictUtils.getDictTypeList() as dictType>
                        <option value="${dictType.type}" label="${dictType.description?default('')}" <#if dict.type?default('') == dictType.type>selected</#if>>${dictType.description?default('')}</option>
                    </#list>
                </select>
			</span>
            <input type="text" class="input-text radius size-M" style="width:250px" placeholder="输入字典标签" id="label" name="label" value="${dict.label?default('')}">
            <button type="submit" class="btn btn-success radius"><i class="Hui-iconfont Hui-iconfont-search2"></i> 搜索</button>
        </div>
    </form>
    <#if message??>
        <div class="Huialert Huialert-info"><i class="Hui-iconfont Hui-iconfont-close"></i>${message}</div>
    </#if>
    <div class="cl pd-5 bg-1 bk-gray mt-20">
        <span class="l">
            <a href="javascript:;" onclick="dataDel('${request.contextPath}/sys/dict/deleteIds?ids=')" class="btn btn-danger radius"><i class="Hui-iconfont Hui-iconfont-del3"></i> 批量删除</a>
            <a href="javascript:;" onclick="data_form('添加字典','${request.contextPath}/sys/dict/form')" class="btn btn-primary radius"><i class="Hui-iconfont Hui-iconfont-add"></i> 添加字典</a>
            <a href="javascript:;" onclick="updateSort('${request.contextPath}/sys/dict/updateSort')" class="btn btn-primary redius"><i class="Hui-iconfont Hui-iconfont-huanyipi"></i> 更新排序</a>
        </span>
        <span class="r">当前分页大小：<strong>${pageInfo.pageSize}</strong>，共有数据：<strong>${pageInfo.total}</strong> 条</span>
    </div>
    <div class="mt-20">
        <form id="listForm" method="post">
            <table id="dataTable" class="table table-border table-bordered table-hover table-bg table-sort">
                <thead>
                <tr class="text-c">
                    <th width="25"><input type="checkbox" name="" value=""></th>
                    <th>键值</th>
                    <th>标签</th>
                    <th>类型</th>
                    <th>描述</th>
                    <th>排序</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <#list pageInfo.list as dict>
                <tr class="text-c">
                    <td><input type="checkbox" value="${dict.id}" name="id"></td>
                    <td>${dict.value}</td>
                    <td>${dict.label}</td>
                    <td>${dict.type}</td>
                    <td>${dict.description?default('')}</td>
                    <td>
                        <div class="text-c">
                            <input type="hidden" class="input-text radius" style="width: 50px;margin:0;padding:0;text-align:center;" name="ids" value="${dict.id}">
                            <input class="input-text radius" style="width: 50px;margin:0;padding:0;text-align:center;" name="sorts" value="${dict.sort}">
                        </div>
                    </td>
                    <td class="td-manage">
                        <a title="编辑" href="javascript:;" onclick="data_form('编辑字典','${request.contextPath}/sys/dict/form?id=${dict.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-edit"></i></a>
                        <a title="删除" href="javascript:;" onclick="data_del(this, '${request.contextPath}/sys/dict/delete?id=${dict.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont Hui-iconfont-del3"></i></a>
                    </td>
                </tr>
                </#list>
                </tbody>
            </table>
        </form>
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

    function updateSort(url){
        layer.open({
            content: '正在更新排序，请稍等...'
        });
        $('#listForm').attr('action', url);
        $('#listForm').submit();
    }
</script>
</@footer>