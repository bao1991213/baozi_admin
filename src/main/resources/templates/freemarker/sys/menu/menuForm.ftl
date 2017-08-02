<#include "/layout/base.ftl">
<@header title="菜单添加/编辑">

</@header>
    <article class="page-container">
        <form class="form form-horizontal" id="form-menu-add" action="${request.contextPath}/sys/menu/save", method="post">
            <input id="id" name="id" type="hidden" value="${menu.id?default('')}">
            <#if message??>
                <div class="Huialert Huialert-info"><i class="Hui-iconfont Hui-iconfont-close"></i>${message}</div>
            </#if>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">上级菜单：</label>
                <div class="form-group col-xs-12 col-sm-4">
                    <input type="hidden" id="parentId" name="parentId" value="${menu.parent.id?default('')}">
                    <input type="text" class="input-text disabled radius size-M f-l" style="width: 80%;" readonly value="${menu.parent.name?default('')}" placeholder="" id="parentName" name="${menu.parent.name?default('')}">
                    <a id="tree" type="button" class="btn btn-primary-outline radius f-l" href="javascript:;" style="width: 20%;"><i class="Hui-iconfont Hui-iconfont-search"></i></a>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>名称：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="text" class="input-text radius size-M" value="${menu.name?default('')}" placeholder="" id="name" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>链接：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="text" class="input-text radius size-M" value="${menu.href?default('')}" placeholder="" id="href" name="href">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>图标：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <i class="Hui-iconfont ${menu.icon?default('')}"></i><label>${menu.icon?default('')}</label>
                    <input type="hidden" id="icon" name="icon" value="${menu.icon?default('')}">
                    <input class="btn btn-default radius" type="button" id="icon" name="icon" onclick="show_icon('选取图标','${request.contextPath}/sys/tag/iconSelect');" value="&nbsp;&nbsp;选择&nbsp;&nbsp;">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>可见：</label>
                <div class="formControls col-xs-8 col-sm-10 skin-minimal">
                    <#list dictUtils.getDictList('show_hide') as dict>
                        <div class="radio-box">
                            <input name="isShow" type="radio" id="isShow-${dict.value}" value="${dict.value}" <#if menu.isShow?default('')==dict.value>checked</#if>>
                            <label for="isShow-${dict.value}">${dict.label}</label>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>排序：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="text" class="input-text radius size-M" value="${menu.sort?default(0)}" placeholder="" id="sort" name="sort">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">权限标识：</label>
                <div class="formControls col-xs-8 col-sm-10 skin-minimal">
                    <input type="text" class="input-text radius size-M" value="${menu.permission?default('')}" id="permission" name="permission">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">备注：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <textarea name="" cols="" rows="" class="textarea radius"  placeholder="说点什么...255个字符以内" dragonfly="true" onKeyUp="$.Huitextarealength(this,255)">${menu.remarks?default('')}</textarea>
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
    <script type="text/javascript">
        $(function(){
            $('.skin-minimal input').iCheck({
                checkboxClass: 'icheckbox-blue',
                radioClass: 'iradio-blue',
                increaseArea: '20%'
            });

            $("#form-menu-add").validate({
                rules:{
                    name:{required:true},
                    isShow:{required:true}
                },
                onkeyup:false,
                focusCleanup:true,
                success:"valid",
                submitHandler:function(form){
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

            $('#tree').click(function(){
                layer.open({
                    type: 2,
                    area: ['300px','400px'],
                    fix: false, //不固定
                    maxmin: true,
                    shadeClose: true,
                    shade:0.4,
                    title: '选择上级菜单',
                    content: '${request.contextPath}/sys/menu/menuTree?id=' + $('#parentId').val()
                });
            });
        });

        /*选取图标*/
        function show_icon(title,url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
    </script>
</@footer>