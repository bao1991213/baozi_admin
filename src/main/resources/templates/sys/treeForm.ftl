<html>
    <head>
        <title>选择上级表单</title>
        <link rel="stylesheet" href="${request.contextPath}/static/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
    </head>
    <body>
        <#-- 树结构数据-平铺  宏定义-->
        <#macro buildTree list>
            <#if list?? && list?size gt 0>
                <#list list as child>
                    <label hidden data-id="${child.id}" data-parentId="${child.parentId}">${child.name}</label>
                    <#if child.childrens?? && child.childrens?size gt 0>
                        <@buildTree list=child.childrens />
                    </#if>
                </#list>
            </#if>
        </#macro>

        <@buildTree list=treeList/>
        <#if entity?? && entity.id?? && entity.parent?? && entity.parent.id?? && entity.parent.name??>
            <input type="hidden" id="id" name="id" value="${entity.id?default('')}" data-parentId="${entity.parent.id?default('')}" data-name="${entity.parent.name?default('')}">
        </#if>
        <div>
            <ul id="menuTree" class="ztree"></ul>
        </div>
        <script type="text/javascript" src="${request.contextPath}/static/lib/jquery/1.9.1/jquery.min.js"></script>
        <script type="text/javascript" src="${request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
        <script type="text/javascript" src="${request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
        <script type="text/javascript" src="${request.contextPath}/static/lib/zTree/v3/js/jquery.ztree.core-3.5.min.js"></script>
        <script type="text/javascript">
            var setting = {
                view: {
                    selectedMulti: false
                },
                callback: {
                    onDblClick: function(event, treeId, treeNode) {
                        parent.$('#parentId').val(treeNode.id);
                        parent.$('#parentName').val(treeNode.name);
                        layer_close();
                    }
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                }
            };

            $(function(){
                var nodes = new Array();
                $('label').each(function(){
                    nodes.push({id:$(this).attr('data-id'),pId:$(this).attr('data-parentId'),name:$(this).html()});
                });
                var zTree = $.fn.zTree.init($("#menuTree"), setting, nodes);
                if ($('#id').length > 0) {
                    var node = zTree.getNodeByParam("id", $('#id').val(), null);
                    zTree.selectNode(node);
                }
            });
        </script>
    </body>
</html>