<#include "/layout/base.ftl">
<@header title="管理员添加/编辑">

</@header>
    <article class="page-container">
        <form class="form form-horizontal" id="form-admin-add" action="${request.contextPath}/sys/user/save", method="post">
            <input id="id" name="id" type="hidden" value="${user.id?default('')}">
            <#if message??>
                <div class="Huialert Huialert-info"><i class="Hui-iconfont Hui-iconfont-close"></i>${message}</div>
            </#if>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>登录名：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="text" class="input-text radius size-M" value="${user.loginName?default('')}" placeholder="登录名,必须输入6位以上,16位以下,只能小写英文或者数字" id="loginName" name="loginName">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>用户名：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="text" class="input-text radius size-M" value="${user.name?default('')}" placeholder="用户名,必须输入6-16位" id="name" name="name">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>工号：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="text" class="input-text radius size-M" value="${user.no?default('')}" placeholder="工号,必须输入4位数值" id="no" name="no">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><#if user.id??><#else><span class="c-red">*</span></#if>密码：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="password" class="input-text radius size-M" autocomplete="off" value="" placeholder="密码,必须输入6位以上,16位以下,只能英文或者数字" id="newPassword" name="newPassword">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><#if user.id??><#else><span class="c-red">*</span></#if>确认密码：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="password" class="input-text radius size-M" autocomplete="off" value="" placeholder="密码,必须输入6位以上,16位以下,只能英文或者数字" id="confirmNewPassword" name="confirmNewPassword">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>启用状态：</label>
                <div class="formControls col-xs-8 col-sm-10 skin-minimal">
                    <#list dictUtils.getDictList('yes_no') as dict>
                        <div class="radio-box">
                            <input name="loginFlag" type="radio" id="loginFlag-${dict.value}" value="${dict.value}" <#if user.loginFlag?default('')==dict.value>checked</#if>>
                            <label for="loginFlag-${dict.value}">${dict.label}</label>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2"><span class="c-red"></span>分页数：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <input type="text" class="input-text radius size-M" autocomplete="off" value="${user.page?default(0)}" placeholder="分页数" id="page" name="page">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">角色：</label>
                <div class="formControls col-xs-8 col-sm-10 skin-minimal">
                    <#list roleList as role>
                        <div class="radio-box">
                            <input name="role" type="checkbox" id="role-${role.id}" value="${role.id}" <#if user.roleList?? && user.roleList?seq_contains(role)> checked><#else>></#if>
                            <label for="role-${role.id}">${role.name}</label>
                        </div>
                    </#list>
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-4 col-sm-2">备注：</label>
                <div class="formControls col-xs-8 col-sm-10">
                    <textarea name="" cols="" rows="" class="textarea radius"  placeholder="说点什么...255个字符以内" dragonfly="true" onKeyUp="$.Huitextarealength(this,255)">${user.remarks?default('')}</textarea>
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

            $("#form-admin-add").validate({
                rules:{
                    no:{required:true, minlength:4, maxlength:4},
                    loginName:{required:true, minlength:6, maxlength:16},
                    name:{required:true, minlength:6, maxlength:16},
                    newPassword:{minlength:6, maxlength:16},
                    confirmNewPassword:{minlength:6, maxlength:16, equalTo: "#newPassword"}
                },
                messages: {
                    confirmNewPassword: {equalTo: "输入与上面相同的密码"}
                },
                onkeyup:false,
                focusCleanup:true,
                success:"valid",
                submitHandler:function(form){
                    $("input[name='role']").each(function(){
                        if ($(this).is(':checked')) {
                            $(this).attr('name', 'roleIds');
                        }
                    });
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