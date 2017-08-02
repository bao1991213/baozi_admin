<#--公共顶部-->
<#macro header title="标题">
<html>
    <head>
        <title>${title}</title>
        <meta name="renderer" content="webkit|ie-comp|ie-stand">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
        <meta http-equiv="Cache-Control" content="no-siteapp" />
        <link rel="Bookmark" href="${request.contextPath}/static/favicon.ico" >
        <link rel="Shortcut Icon" href="${request.contextPath}/static/favicon.ico" />

        <!--[if lt IE 9]-->
        <script type="text/javascript" src="${request.contextPath}/static/lib/html5shiv.js"></script>
        <script type="text/javascript" src="${request.contextPath}/static/lib/respond.min.js"></script>
        <!--[endif]-->
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/h-ui/css/H-ui.min.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/lib/Hui-iconfont/1.0.8/iconfont.css" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/h-ui.admin/skin/default/skin.css" id="skin" />
        <link rel="stylesheet" type="text/css" href="${request.contextPath}/static/h-ui.admin/css/style.css" />
        <!--[if lt IE 6]-->
        <script type="text/javascript" src="${request.contextPath}/static/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
        <script>DD_belatedPNG.fix('*');</script>
        <!--[endif]-->
        <#nested>
    </head>
    <body>
</#macro>

<#--公共底部-->
<#macro footer>
    <script type="text/javascript" src="${request.contextPath}/static/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/jquery.validation/1.14.0/validate-methods.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/jquery.validation/1.14.0/messages_zh.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/layer/2.4/layer.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/common/admin.js"></script>

    <script type="text/javascript" src="${request.contextPath}/static/lib/My97DatePicker/4.8/WdatePicker.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="${request.contextPath}/static/lib/laypage/1.2/laypage.js"></script>

    <script type="text/javascript">
        $(function(){
            if ($('#page').length > 0) {
                laypage({cont: 'page', pages: $('#page').attr('data-pages'), curr: $('#pageNum').val(), first: '首页', last: '尾页', skip: true, skin: '#1E9FFF',
                    jump: function(e, first){
                        if (!first) {
                            $('#pageNum').val(e.curr);
                            $('#searchForm').submit();
                        }
                    }
                });
            }
        });
        /*bean 添加 编辑*/
        function data_form(title, url){
            var index = layer.open({
                type: 2,
                title: title,
                content: url
            });
            layer.full(index);
        }
        /*bean 删除*/
        function data_del(obj, url){
            layer.confirm('确认要删除吗？', function(){
                $.ajax({
                    type: 'GET',
                    url: url,
                    dataType: 'json',
                    success: function(data){
                        layer.open({title: '提示', content: data.m, time: 2000, end: function(){
                            if (data.c == 1) {
                                parent.$(obj).parents("tr").remove();
                                layer_close();
                            }
                        }});
                    },
                    error: function(){
                        layer.open({title: '提示', content: '系统异常,请联系技术人员'});
                    }
                });
            });
        }
    </script>
    <#nested>
    </body>
</html>
</#macro>