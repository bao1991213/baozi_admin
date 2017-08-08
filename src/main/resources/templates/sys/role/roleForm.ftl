<#include "/layout/base.ftl">
<@header title="角色添加/编辑">
    <link rel="stylesheet" href="${request.contextPath}/static/lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</@header>
<#-- 树结构数据-平铺  宏定义-->
<#macro buildTree list>
    <#if list?? && list?size gt 0>
        <#list list as child>
            <label name="menu" hidden data-id="${child.id}" data-parentId="${child.parentId}">${child.name}</label>
            <#if child.childrens?? && child.childrens?size gt 0>
                <@buildTree list=child.childrens />
            </#if>
        </#list>
    </#if>
</#macro>
<#-- role hasMenuIdList-->
<#macro buildHasMenu list>
    <#if list?? && list?size gt 0>
        <#list list as item>
            <label name="hasMenu" hidden data-id="${item}"></label>
        </#list>
    </#if>
</#macro>

<article class="page-container">
    <form class="form form-horizontal" id="form-role-add" action="${request.contextPath}/sys/role/save" method="post">
        <input id="id" name="id" type="hidden" value="${role.id?default('')}">
        <#if message??>
            <div class="Huialert Huialert-info"><i class="Hui-iconfont Hui-iconfont-close"></i>${message}</div>
        </#if>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>角色名：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <input type="text" class="input-text radius size-M" value="${role.name?default('')}" id="name" name="name">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>启用状态：</label>
            <div class="formControls col-xs-8 col-sm-10 skin-minimal">
                <#list dictUtils.getDictList('yes_no') as dict>
                    <div class="radio-box">
                        <input name="useable" type="radio" id="useable-${dict.value}" value="${dict.value}" <#if role.useable?default('')==dict.value>checked</#if>>
                        <label for="useable-${dict.value}">${dict.label}</label>
                    </div>
                </#list>
            </div>
        </div>
        <@buildTree list=treeMenuList/>
        <@buildHasMenu list=role.menuIdList/>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>菜单列表：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <ul id="menuTree" class="ztree"></ul>
                <input type="hidden" id="menuIds" name="menuIds">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <textarea name="" cols="" rows="" class="textarea radius"  placeholder="说点什么...255个字符以内" dragonfly="true" onKeyUp="$.Huitextarealength(this,255)">${role.remarks?default('')}</textarea>
                <p class="textarea-numberbar"><em class="textarea-length">0</em>/255</p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-10 col-xs-offset-4 col-sm-offset-2">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
                <input class="btn btn-warning radius" type="reset" value="&nbsp;&nbsp;重置&nbsp;&nbsp;">
                <input class="btn btn-default radius" type="button" onclick="layer_close();" value="&nbsp;&nbsp;取消&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>
<@footer>
    <script type="text/javascript" src="${request.contextPath}/static/lib/zTree/v3/js/jquery.ztree.core-3.5.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/zTree/v3/js/jquery.ztree.excheck-3.5.min.js"></script>
    <script type="text/javascript">
        var setting = {
            view: {
                selectedMulti: false
            },
            callback: {
            },
            check: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            }
        };
        $(function(){
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            var nodes = new Array();
            $("label[name='menu']").each(function(){
                nodes.push({id:$(this).attr('data-id'),pId:$(this).attr('data-parentId'),name:$(this).html()});
            });
            var zTree = $.fn.zTree.init($("#menuTree"), setting, nodes);
            // 不选择父节点
            zTree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
            // 默认选择节点
            var ids = $("label[name='hasMenu']");
            for(var i = 0; i < ids.length; i++) {
                var node = zTree.getNodeByParam("id", $(ids[i]).attr('data-id'));
                try{zTree.checkNode(node, true, false);}catch(e){}
            }
            $("#form-role-add").validate({
                rules:{
                    name:{required:true, minlength:1, maxlength:100}
                },
                onkeyup:false,
                focusCleanup:true,
                success:"valid",
                submitHandler:function(form){
                    var ids = [], nodes = zTree.getCheckedNodes(true);
                    for(var i = 0; i < nodes.length; i++) {
                        ids.push(nodes[i].id);
                    }
                    $("#menuIds").val(ids);
                    $(form).ajaxSubmit({
                        success: function(data) {
                            layer.open({title: '提示', content: data.m, end: function(){
                                if (data.c == 1) {
                                    layer_close();
                                }
                            }});
                        },
                        error: function(){
                            layer.open({title: '提示', content: '系统异常,请联系技术人员'});
                        }
                    });
                }
            });
        });
    </script>
</@footer>