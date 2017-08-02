<#include "/layout/base.ftl">
<@header title="后台管理登录">
    <link href="${request.contextPath}/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
</@header>
<div class="header"></div>
<div class="loginWraper">
    <div class="loginBox">
        <form id="loginForm" class="form form-horizontal" action="${request.contextPath}/login" method="post">
            <div id="messageBox" class="Huialert Huialert-info <#if message??><#else>hidden</#if>">
                <i class="Hui-iconfont Hui-iconfont-close"></i>${message?default('')}
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont Hui-iconfont-user2"></i></label>
                <div class="formControls col-xs-8">
                    <input id="username" name="username" type="text" placeholder="账户" class="input-text radius size-L">
                </div>
            </div>
            <div class="row cl">
                <label class="form-label col-xs-3"><i class="Hui-iconfont Hui-iconfont-suoding"></i></label>
                <div class="formControls col-xs-8">
                    <input id="password" name="password" type="password" placeholder="密码" class="input-text radius size-L">
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input id="validateCode" name="validateCode" class="input-text radius size-L" type="text" maxlength="4" placeholder="验证码"
                           onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
                    <img id="validateCodeImg" src="${request.contextPath}/validateCodeServlet"> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <label for="online">
                        <input type="checkbox" name="rememberMe" id="rememberMe">
                        使我保持登录状态</label>
                </div>
            </div>
            <div class="row cl">
                <div class="formControls col-xs-8 col-xs-offset-3">
                    <input name="" type="submit" class="btn btn-success radius size-L"
                           value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
                    <input name="" type="reset" class="btn btn-default radius size-L"
                           value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
                </div>
            </div>
        </form>
    </div>
</div>
<div class="footer">Copyright baozi_admin by H-ui.admin v3.0</div>
<@footer>
    <script type="text/javascript" src="/static/lib/rsa/jsbn.js"></script>
    <script type="text/javascript" src="/static/lib/rsa/prng4.js"></script>
    <script type="text/javascript" src="/static/lib/rsa/rng.js"></script>
    <script type="text/javascript" src="/static/lib/rsa/rsa.js"></script>
    <script type="text/javascript" src="/static/lib/rsa/base64.js"></script>
    <script type="text/javascript" src="/static/lib/common/login.js"></script>
    <script>
        $(function(){
            $('#username').focus();
            Login.init('${request.contextPath}');

            $('#kanbuq').click(function(){
                $('#validateCodeImg').attr('src', '${request.contextPath}/validateCodeServlet?_t=' + Math.random());
            });
        });
    </script>
</@footer>