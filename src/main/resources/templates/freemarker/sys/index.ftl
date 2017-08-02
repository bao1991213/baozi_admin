<#include "/layout/base.ftl">
<#include "/common/tree.ftl" >
<@header title="后台首页">

</@header>
<header class="navbar-wrapper">
    <div class="navbar navbar-fixed-top">
        <div class="container-fluid cl"> <a class="logo navbar-logo f-l mr-10 hidden-xs" style="width: 175px;" href="${request.contextPath}">baozi_admin管理系统</a>
            <a aria-hidden="false" class="nav-toggle Hui-iconfont Hui-iconfont-menu visible-xs" href="javascript:;"></a>
            <nav id="topMenu" class="nav navbar-nav">
                <ul class="cl">
                    <@buildNode list=treeMenuList/>
                </ul>
            </nav>
            <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
                <ul class="cl">
                    <li class="dropDown dropDown_hover">
                        <input type="hidden" value="${user.id}" id="userId">
                        <a href="#" class="dropDown_A">${user.name}<i class="Hui-iconfont Hui-iconfont-arrow2-bottom"></i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" id="modifyPwd">修改密码</a></li>
                            <li><a href="javascript:;" id="modifyUser">修改信息</a></li>
                            <li><a href="${request.contextPath}/logout">退出</a></li>
                        </ul>
                    <li><a href="logout">退出</a></li>
                    <li id="Hui-msg"> <a href="#" title="消息"><span class="badge badge-danger">0</span><i class="Hui-iconfont Hui-iconfont-xiaoxi" style="font-size:18px"></i></a> </li>
                    <li id="Hui-skin" class="dropDown right dropDown_hover"> <a href="javascript:;" class="dropDown_A" title="换肤"><i class="Hui-iconfont Hui-iconfont-pifu" style="font-size:18px"></i></a>
                        <ul class="dropDown-menu menu radius box-shadow">
                            <li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
                            <li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
                            <li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
                            <li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
                            <li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
                            <li><a href="javascript:;" data-val="orange" title="橙色">橙色</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">

    </div>
</aside>
<div class="dislpayArrow hidden-xs"><a class="pngfix" href="javascript:;" onClick="displaynavbar(this)"></a></div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active">
                    <span title="我的桌面" data-href="welcome.html">我的桌面</span>
                    <em></em></li>
            </ul>
        </div>
        <div class="Hui-tabNav-more btn-group">
            <a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont Hui-iconfont-arrow2-left"></i></a>
            <a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont Hui-iconfont-arrow2-right"></i></a></div>
    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display:none" class="loading"></div>
            <iframe id="mainFrame" name="mainFrame" scrolling="yes" frameborder="0" src="${request.contextPath}/index/welcome"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前 </li>
        <li id="closeall">关闭全部 </li>
    </ul>
</div>
<@footer>
    <script type="text/javascript" src="/static/lib/jquery.contextmenu/jquery.contextmenu.r2.js"></script>
    <script type="text/javascript">
        $(function(){
            $('#topMenu ul li a').click(function(){
                $('.menu_dropdown').empty();
                $('#topMenu ul li a').each(function(){
                    $(this).removeClass('hover');
                });
                $(this).addClass('hover');
                //调用递归,处理左侧栏
                treeMenu($(this));
                $(".Hui-aside").Huifold({
                    titCell:'.menu_dropdown dl dt',
                    mainCell:'.menu_dropdown dl dd',
                });
            });
        });

        // jquery递归 topMenu菜单
        function treeMenu(treeMenuVar) {
            var tree = $(treeMenuVar).parent().children('ul');
            for (var i = 0; i < $(tree).children('li').length; i++) {
                var node = $($(tree).children('li')[i]);
                var node_a = node.children('a');
                if (node.children('ul').children('li').length == 0) {
                    if ($('#menu_' + node_a.attr('data-parentId')).length > 0) {
                        $('#menu_' + node_a.attr('data-parentId')).find('dd ul').append('<li>' +
                                '<a data-name="menu" target="mainFrame" data-href="' + node_a.attr('data-href') + '" data-title="' + node_a.attr('data-name') + '" href="javascript:;" onclick="changeCurrent(this)">' +
                                '<i class="' + node_a.find('i').attr('class') + '"></i> ' + node_a.attr('data-name') + '</a></li>');
                    } else {
                        $('.menu_dropdown').append('<ul id="menu_' + node_a.attr('data-id') + '"><li>' +
                                '<a data-name="menu" target="mainFrame" data-href="' + node_a.attr('data-href') + '" data-title="' + node_a.attr('data-name') + '" href="javascript:;" onclick="changeCurrent(this)">' +
                                '<i class="' + node_a.find('i').attr('class') + '"></i> ' + node_a.attr('data-name') + '</a></li></ul>');
                    }
                } else {
                    $('.menu_dropdown').append('<dl id="menu_' + node_a.attr('data-id') + '"><dt>' +
                            '<i class="' + node_a.find('i').attr('class') + '"></i> ' + node_a.attr('data-name') +
                            '<i class="Hui-iconfont Hui-iconfont-arrow2-bottom menu_dropdown-arrow"></i></dt><dd><ul></ul></dd></dl>');
                    treeMenu(node.children('ul'));
                }
            }
        }

        function changeCurrent(obj) {
            $('.menu_dropdown').find('li').removeClass('current');
            $(obj).parent().addClass('current');
        }

        $('#modifyPwd').click(function(){
            layer.open({
                type: 2,
                area: ['440px','310px'],
                fix: false, //不固定
                maxmin: true,
                shadeClose: true,
                shade:0.4,
                title: '修改密码',
                content: '${request.contextPath}/sys/user/modifyPwdForm?id=' + $('#userId').val()
            });
        });

        $('#modifyUser').click(function(){
            layer.open({
                type: 2,
                area: ['300px','330px'],
                fix: false, //不固定
                maxmin: true,
                shadeClose: true,
                shade:0.4,
                title: '修改信息',
                content: '${request.contextPath}/sys/user/modifyUserForm?id=' + $('#userId').val()
            });
        });
    </script>
</@footer>