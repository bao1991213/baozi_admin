<!-- 递归  宏定义 -->
<#macro buildNode list>
    <#if list?? && list?size gt 0>
        <#list list as child>
            <#if child.childrens?? && child.childrens?size gt 0>
            <li>
                <a href="javascript:;" data-id="${child.id}" data-parentId="${child.parentId}" data-name="${child.name}" data-href="${child.href}">
                    <i class="Hui-iconfont ${child.icon}" aria-hidden="true"></i> <span>${child.name}</span>
                </a>
                <ul data-id="${child.id}" data-panretId="${child.parentId}" data-class="${child.icon}" class="visible-print-block">
                    <@buildNode list=child.childrens />
                </ul>
            </li>
            <#else>
            <#assign showClass=''>
            <#if child.isShow=='1'>
                <li>
                    <a data-id="${child.id}" data-parentId="${child.parentId}" data-name="${child.name}" data-href="${child.href}">
                        <i class="Hui-iconfont ${child.icon}" aria-hidden="true"></i> ${child.name}</a>
                </li>
            </#if>
            </#if>
        </#list>
    </#if>
</#macro>