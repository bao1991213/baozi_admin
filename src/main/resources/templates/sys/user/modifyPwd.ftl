<#include "/layout/base.ftl">
<@header title="修改密码">

</@header>
<article class="page-container">
    <form action="${request.contextPath}/sys/user/modifyPwd" method="post" class="form form-horizontal" id="modifyPwdForm">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>账户：</label>
            <div class="formControls col-xs-8 col-sm-9"> ${user.name} </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>旧密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text radius size-M" autocomplete="off" placeholder="不修改请直接关闭" name="oldPassword" id="oldPassword">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>新密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text radius size-M" autocomplete="off" placeholder="不修改请直接关闭" name="newPassword" id="newPassword">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>确认密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text radius size-M" autocomplete="off" placeholder="不修改请直接关闭" name="confirmNewPassword" id="confirmNewPassword">
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
        $("#oldPassword").focus();
        $("#modifyPwdForm").validate({
            rules:{
                oldPassword:{required:true, minlength:6, maxlength:16},
                newPassword:{required:true, minlength:6, maxlength:16},
                confirmNewPassword:{required:true, minlength:6, maxlength:16, equalTo: "#newPassword"},
            },
            messages: {
                confirmNewPassword: {equalTo: "输入与上面相同的密码"}
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