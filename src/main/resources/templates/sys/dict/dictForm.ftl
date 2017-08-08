<#include "/layout/base.ftl">
<@header title="字典添加/编辑">

</@header>
<article class="page-container" xmlns:form="http://www.w3.org/1999/html">
    <form class="form form-horizontal" id="form-dict-add" action="${request.contextPath}/sys/dict/save", method="post">
        <input id="id" name="id" type="hidden" value="${dict.id?default('')}">
        <#if message??>
            <div class="Huialert Huialert-info"><i class="Hui-iconfont Hui-iconfont-close"></i>${message}</div>
        </#if>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>键值：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <input type="text" class="input-text radius size-M" value="${dict.value?default('')}" placeholder="" id="value" name="value">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>标签：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <textarea name="label" cols="" rows="" class="input-text radius size-M"  value="" placeholder="">${dict.label?default('')}</textarea>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>类型：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <input type="text" class="input-text radius size-M" value="${dict.type?default('')}" placeholder="" id="type" name="type">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">描述：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <input type="text" class="input-text radius size-M" value="${dict.description?default('')}" placeholder="" id="description" name="description">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>排序：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <input type="text" class="input-text radius size-M" value="${dict.sort?default('')}" placeholder="" id="sort" name="sort">
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-2">备注：</label>
            <div class="formControls col-xs-8 col-sm-10">
                <textarea name="remarks" cols="" rows="" class="textarea radius"  placeholder="说点什么...255个字符以内" dragonfly="true" onKeyUp="$.Huitextarealength(this,255)">${dict.remarks?default('')}</textarea>
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
        $('#label').value = $('#label').val();
        $('.skin-minimal input').iCheck({
            checkboxClass: 'icheckbox-blue',
            radioClass: 'iradio-blue',
            increaseArea: '20%'
        });

        $("#form-dict-add").validate({
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