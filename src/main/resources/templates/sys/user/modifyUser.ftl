<#include "/layout/base.ftl">
<@header title="修改信息">

</@header>
<article class="page-container">
    <form action="${request.contextPath}/sys/user/modifyUser" method="post" class="form form-horizontal" id="modifyUserForm">
        <input type="hidden" name="id" id="id" value="${user.id}">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>工号：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-M" name="no" id="no" value="${user.no}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>登录名 ：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-M" name="loginName" id="loginName" value="${user.loginName}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-M" name="name" id="name" value="${user.name}">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>分页值：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text radius size-M" name="page" id="page" value="${user.page}">
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;保存&nbsp;&nbsp;">
            </div>
        </div>
    </form>
</article>
<@footer>
<script type="text/javascript">
    $(function(){
        $("#modifyUserForm").validate({
            rules:{
                no:{required:true, minlength:4, maxlength:4},
                loginName:{required:true, minlength:6, maxlength:16},
                name:{required:true, minlength:4, maxlength:16},
                page:{required:true}
            },
            onkeyup:false,
            focusCleanup:true,
            submitHandler:function(form){
                $(form).ajaxSubmit({
                    success: function(data) {
                        layer.open({title: '提示', content: data.m, time: 2000, end: function(){
                            if (data.c == 1) {
                                layer_close();
                            }
                        }});
                    }
                });
            }
        });
    });
</script>
</@footer>