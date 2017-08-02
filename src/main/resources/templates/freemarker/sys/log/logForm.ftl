<#include "/layout/base.ftl">
<@header title="日志详情">

</@header>
<article class="page-container">
    <div class="panel panel-default">
        <div class="panel-header">操作用户</div>
        <div class="panel-body">${log.createBy.name?default('')}</div>
    </div>
    <div class="panel panel-default">
        <div class="panel-header">操作菜单</div>
        <div class="panel-body">${log.title?default('')}</div>
    </div>
    <div class="panel panel-default">
        <div class="panel-header">操作URL</div>
        <div class="panel-body">${log.requestUri?default('')}</div>
    </div>
    <div class="panel panel-default">
        <div class="panel-header">参数</div>
        <div class="panel-body">${log.params?default('')}</div>
    </div>
</article>
<@footer>
</@footer>