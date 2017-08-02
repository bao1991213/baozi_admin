<#include "/layout/base.ftl">
<@header title="图标选择">
<style type="text/css">
    .main {
        padding: 30px 100px;
    }

    .main h1 {
        font-size: 36px;
        line-height: 1.6;
        color: #333;
        text-align: center;
        margin-bottom: 30px;
        font-weight: normal
    }

    .main h2 {
        font-size: 24px;
        line-height: 1.6;
        color: #333;
        border-bottom: 1px solid #eee;
        font-weight: normal
    }

    .helps pre {
        padding: 20px;
        margin: 10px 0;
        border: solid 1px #e7e1cd;
        background-color: #fffdef;
        overflow: auto
    }

    .icon_lists li {
        float: left;
        width: 60px;
        height: 60px;
        text-align: center
    }

    .icon_lists .Hui-iconfont {
        font-size: 50px;
        line-height: 100px;
        margin: 10px 0;
        color: #333;
        -webkit-transition: font-size 0.25s ease-out 0s;
        -moz-transition: font-size 0.25s ease-out 0s;
        transition: font-size 0.25s ease-out 0s
    }

    .icon_lists .Hui-iconfont:hover {
        font-size: 100px
    }
</style>
</@header>
<div class="main">
    <h2>操作相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-gotop" data-name="返回顶部" data-value="Hui-iconfont-gotop"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-menu" data-name="列表" data-value="Hui-iconfont-menu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jiandao" data-name="剪切" data-value="Hui-iconfont-jiandao"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-search2" data-name="搜索2" data-value="Hui-iconfont-search2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-search1" data-name="搜索1" data-value="Hui-iconfont-search1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-save" data-name="保存" data-value="Hui-iconfont-save"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-chexiao" data-name="撤销" data-value="Hui-iconfont-chexiao"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhongzuo" data-name="重做" data-value="Hui-iconfont-zhongzuo"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-down" data-name="下载" data-value="Hui-iconfont-down"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-slider-right" data-name="切换器右" data-value="Hui-iconfont-slider-right"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-slider-left" data-name="切换器左" data-value="Hui-iconfont-slider-left"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-fabu" data-name="发布" data-value="Hui-iconfont-fabu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-add2" data-name="添加" data-value="Hui-iconfont-add2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-huanyipi" data-name="换一批" data-value="Hui-iconfont-huanyipi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-dengdai" data-name="等待" data-value="Hui-iconfont-dengdai"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-daochu" data-name="导出" data-value="Hui-iconfont-daochu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-daoru" data-name="导入" data-value="Hui-iconfont-daoru"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-del" data-name="删除" data-value="Hui-iconfont-del"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-del2" data-name="删除" data-value="Hui-iconfont-del2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-del3" data-name="删除" data-value="Hui-iconfont-del3"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shuru" data-name="输入" data-value="Hui-iconfont-shuru"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-add" data-name="添加" data-value="Hui-iconfont-add"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jianhao" data-name="减号" data-value="Hui-iconfont-jianhao"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-edit2" data-name="编辑" data-value="Hui-iconfont-edit2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-edit" data-name="编辑" data-value="Hui-iconfont-edit"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-manage" data-name="管理" data-value="Hui-iconfont-manage"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-add3" data-name="添加" data-value="Hui-iconfont-add3"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-add4" data-name="添加" data-value="Hui-iconfont-add4"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-key" data-name="密码" data-value="Hui-iconfont-key"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jiesuo" data-name="解锁" data-value="Hui-iconfont-jiesuo"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-suoding" data-name="锁定" data-value="Hui-iconfont-suoding"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-close" data-name="关闭" data-value="Hui-iconfont-close"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-close2" data-name="关闭2" data-value="Hui-iconfont-close2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xuanze" data-name="选择" data-value="Hui-iconfont-xuanze"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-weigouxuan2" data-name="未选" data-value="Hui-iconfont-weigouxuan2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xuanzhong1" data-name="选中" data-value="Hui-iconfont-xuanzhong1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xuanzhong" data-name="选中" data-value="Hui-iconfont-xuanzhong"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-weixuanzhong" data-name="未选中" data-value="Hui-iconfont-weixuanzhong"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-gouxuan2" data-name="启用" data-value="Hui-iconfont-gouxuan2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-chongqi" data-name="重启" data-value="Hui-iconfont-chongqi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-selected" data-name="勾选" data-value="Hui-iconfont-selected"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shangjia" data-name="上架" data-value="Hui-iconfont-shangjia"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xiajia" data-name="下架" data-value="Hui-iconfont-xiajia"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-upload" data-name="上传" data-value="Hui-iconfont-upload"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yundown" data-name="下载" data-value="Hui-iconfont-yundown"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-caiqie" data-name="剪裁" data-value="Hui-iconfont-caiqie"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xuanzhuan" data-name="旋转" data-value="Hui-iconfont-xuanzhuan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-gouxuan" data-name="启用" data-value="Hui-iconfont-gouxuan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-weigouxuan" data-name="未勾选" data-value="Hui-iconfont-weigouxuan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-luyin" data-name="录音" data-value="Hui-iconfont-luyin"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yulan" data-name="预览" data-value="Hui-iconfont-yulan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shenhe-weitongguo" data-name="审核不通过" data-value="Hui-iconfont-shenhe-weitongguo"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shenhe-butongguo2" data-name="审核不通过" data-value="Hui-iconfont-shenhe-butongguo2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shenhe-tongguo" data-name="审核通过" data-value="Hui-iconfont-shenhe-tongguo"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shenhe-tingyong" data-name="停用" data-value="Hui-iconfont-shenhe-tingyong"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-bofang" data-name="播放" data-value="Hui-iconfont-bofang"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shangyishou" data-name="上一首" data-value="Hui-iconfont-shangyishou"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xiayishou" data-name="下一首" data-value="Hui-iconfont-xiayishou"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zanting" data-name="暂停" data-value="Hui-iconfont-zanting"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tingzhi" data-name="停止" data-value="Hui-iconfont-tingzhi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yuedu" data-name="阅读" data-value="Hui-iconfont-yuedu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yanjing" data-name="眼睛" data-value="Hui-iconfont-yanjing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-power" data-name="电源" data-value="Hui-iconfont-power"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xiangpicha" data-name="图标2_橡皮擦" data-value="Hui-iconfont-xiangpicha"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jishiqi" data-name="计时器" data-value="Hui-iconfont-jishiqi"></i></li>
    </ul>
    <h2>菜单相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-home" data-name="home" data-value="Hui-iconfont-home"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-home2" data-name="小箭头" data-value="Hui-iconfont-home2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-news" data-name="cmstop新闻" data-value="Hui-iconfont-news"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tuku" data-name="图片" data-value="Hui-iconfont-tuku"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-music" data-name="音乐" data-value="Hui-iconfont-music"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tags" data-name="标签" data-value="Hui-iconfont-tags"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yuyin3" data-name="语音" data-value="Hui-iconfont-yuyin3"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-system" data-name="系统" data-value="Hui-iconfont-system"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-help" data-name="帮助" data-value="Hui-iconfont-help"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-chuku" data-name="出库" data-value="Hui-iconfont-chuku"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-picture" data-name="图片" data-value="Hui-iconfont-picture"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-fenlei" data-name="分类" data-value="Hui-iconfont-fenlei"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-hetong" data-name="合同管理" data-value="Hui-iconfont-hetong"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-quanbudingdan" data-name="全部订单" data-value="Hui-iconfont-quanbudingdan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-renwu" data-name="任务管理" data-value="Hui-iconfont-renwu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-feedback" data-name="问题反馈" data-value="Hui-iconfont-feedback"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-feedback2" data-name="意见反馈" data-value="Hui-iconfont-feedback2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-dangan" data-name="合同" data-value="Hui-iconfont-dangan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-log" data-name="日志" data-value="Hui-iconfont-log"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-pages" data-name="列表页面" data-value="Hui-iconfont-pages"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-file" data-name="文件" data-value="Hui-iconfont-file"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-manage2" data-name="管理" data-value="Hui-iconfont-manage2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-order" data-name="订单" data-value="Hui-iconfont-order"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yuyin2" data-name="语音" data-value="Hui-iconfont-yuyin2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yuyin" data-name="语音" data-value="Hui-iconfont-yuyin"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-picture1" data-name="图片" data-value="Hui-iconfont-picture1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tuwenxiangqing" data-name="图文详情" data-value="Hui-iconfont-tuwenxiangqing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-moban-2" data-name="模版" data-value="Hui-iconfont-moban-2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jieri" data-name="节日" data-value="Hui-iconfont-jieri"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-moban" data-name="随你后台-网站" data-value="Hui-iconfont-moban"></i></li>
    </ul>
    <h2>天气相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-tianqi-duoyun" data-name="多云" data-value="Hui-iconfont-tianqi-duoyun"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tianqi-mai" data-name="霾" data-value="Hui-iconfont-tianqi-mai"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tianqi-qing" data-name="晴" data-value="Hui-iconfont-tianqi-qing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tianqi-wu" data-name="雾" data-value="Hui-iconfont-tianqi-wu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tianqi-xue" data-name="雪" data-value="Hui-iconfont-tianqi-xue"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tianqi-yin" data-name="阴" data-value="Hui-iconfont-tianqi-yin"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tianqi-yu" data-name="雨" data-value="Hui-iconfont-tianqi-yu"></i></li>
    </ul>
    <h2>用户相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-user" data-name="用户" data-value="Hui-iconfont-user"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-user2" data-name="用户" data-value="Hui-iconfont-user2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-avatar" data-name="用户头像" data-value="Hui-iconfont-avatar"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-avatar2" data-name="个人中心" data-value="Hui-iconfont-avatar2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-user-add" data-name="添加用户" data-value="Hui-iconfont-user-add"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-userid" data-name="用户ID" data-value="Hui-iconfont-userid"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhizhao" data-name="证照管理" data-value="Hui-iconfont-zhizhao"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-practice" data-name="执业证" data-value="Hui-iconfont-practice"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-user-group" data-name="群组" data-value="Hui-iconfont-user-group"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-user-zhanzhang" data-name="站长" data-value="Hui-iconfont-user-zhanzhang"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-root" data-name="管理员" data-value="Hui-iconfont-root"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-gongsi" data-name="公司" data-value="Hui-iconfont-gongsi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-vip-card2" data-name="会员卡" data-value="Hui-iconfont-vip-card2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-vip" data-name="会员" data-value="Hui-iconfont-vip"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-usergroup2" data-name="群组" data-value="Hui-iconfont-usergroup2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-kefu" data-name="客服" data-value="Hui-iconfont-kefu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-banzhu" data-name="版主" data-value="Hui-iconfont-banzhu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-huangguan" data-name="皇冠" data-value="Hui-iconfont-huangguan"></i></li>
    </ul>
    <h2>表情相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-face2" data-name="表情" data-value="Hui-iconfont-face2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face" data-name="表情" data-value="Hui-iconfont-face"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-weixiao" data-name="微笑" data-value="Hui-iconfont-face-weixiao"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-ku" data-name="哭脸" data-value="Hui-iconfont-face-ku"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-chijing" data-name="吃惊" data-value="Hui-iconfont-face-chijing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-dai" data-name="呆" data-value="Hui-iconfont-face-dai"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-shuaku" data-name="耍酷" data-value="Hui-iconfont-face-shuaku"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-mogui" data-name="魔鬼" data-value="Hui-iconfont-face-mogui"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-ganga" data-name="尴尬" data-value="Hui-iconfont-face-ganga"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-qin" data-name="亲" data-value="Hui-iconfont-face-qin"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-nu" data-name="怒" data-value="Hui-iconfont-face-nu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-zhayan" data-name="眨眼" data-value="Hui-iconfont-face-zhayan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-shengqi" data-name="生气" data-value="Hui-iconfont-face-shengqi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-ma" data-name="骂" data-value="Hui-iconfont-face-ma"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-bishi" data-name="鄙视" data-value="Hui-iconfont-face-bishi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-maimeng" data-name="卖萌" data-value="Hui-iconfont-face-maimeng"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-jingdai" data-name="惊呆" data-value="Hui-iconfont-face-jingdai"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-face-yun" data-name="晕" data-value="Hui-iconfont-face-yun"></i></li>
    </ul>
    <h2>社区相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-share2" data-name="分享" data-value="Hui-iconfont-share2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share" data-name="分享" data-value="Hui-iconfont-share"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-renren" data-name="人人网" data-value="Hui-iconfont-share-renren"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-tweibo" data-name="腾讯微博" data-value="Hui-iconfont-share-tweibo"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-douban" data-name="豆瓣" data-value="Hui-iconfont-share-douban"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-pengyouquan" data-name="朋友圈" data-value="Hui-iconfont-share-pengyouquan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-weixin" data-name="微信" data-value="Hui-iconfont-share-weixin"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-qq" data-name="QQ" data-value="Hui-iconfont-share-qq"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-qzone" data-name="QQ空间" data-value="Hui-iconfont-share-qzone"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-weibo" data-name="微博" data-value="Hui-iconfont-share-weibo"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-share-zhihu" data-name="知乎" data-value="Hui-iconfont-share-zhihu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-gengduo" data-name="更多" data-value="Hui-iconfont-gengduo"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-gengduo2" data-name="更多" data-value="Hui-iconfont-gengduo2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-engduo3" data-name="更多" data-value="Hui-iconfont-engduo3"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-gengduo4" data-name="更多" data-value="Hui-iconfont-gengduo4"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-like" data-name="喜欢" data-value="Hui-iconfont-like"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-like2" data-name="喜欢" data-value="Hui-iconfont-like2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yiguanzhu" data-name="已关注" data-value="Hui-iconfont-yiguanzhu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-comment" data-name="评论" data-value="Hui-iconfont-comment"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-leijipingjia" data-name="累计评价" data-value="Hui-iconfont-leijipingjia"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xiaoxi" data-name="消息" data-value="Hui-iconfont-xiaoxi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cang" data-name="收藏" data-value="Hui-iconfont-cang"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cang-selected" data-name="收藏-选中" data-value="Hui-iconfont-cang-selected"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cang2" data-name="收藏" data-value="Hui-iconfont-cang2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cang2-selected" data-name="收藏-选中" data-value="Hui-iconfont-cang2-selected"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-more" data-name="关注-更多操作" data-value="Hui-iconfont-more"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zan" data-name="赞扬" data-value="Hui-iconfont-zan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cai" data-name="批评" data-value="Hui-iconfont-cai"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zan2" data-name="点赞" data-value="Hui-iconfont-zan2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-msg" data-name="通知" data-value="Hui-iconfont-msg"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-email" data-name="消息管理" data-value="Hui-iconfont-email"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-yiguanzhu1" data-name="已关注店铺" data-value="Hui-iconfont-yiguanzhu1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhuanfa" data-name="转发" data-value="Hui-iconfont-zhuanfa"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-daipingjia" data-name="待评价" data-value="Hui-iconfont-daipingjia"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jifen" data-name="积分" data-value="Hui-iconfont-jifen"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xiaoxi1" data-name="消息" data-value="Hui-iconfont-xiaoxi1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-read" data-name="已读" data-value="Hui-iconfont-read"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-feedback1" data-name="用户反馈" data-value="Hui-iconfont-feedback1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-dingyue" data-name="订阅" data-value="Hui-iconfont-dingyue"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tishi" data-name="提示" data-value="Hui-iconfont-tishi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-star-o" data-name="star-o" data-value="Hui-iconfont-star-o"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-star" data-name="star" data-value="Hui-iconfont-star"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-star-half" data-name="star-half" data-value="Hui-iconfont-star-half"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-star-halfempty" data-name="star-half-empty" data-value="Hui-iconfont-star-halfempty"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-comment1" data-name="我的评价" data-value="Hui-iconfont-comment1"></i></li>
    </ul>
    <h2>统计相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-tongji-bing" data-name="数据统计" data-value="Hui-iconfont-tongji-bing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-ad" data-name="统计管理" data-value="Hui-iconfont-ad"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shujutongji" data-name="数据统计" data-value="Hui-iconfont-shujutongji"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tongji" data-name="统计" data-value="Hui-iconfont-tongji"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tongji-zhu" data-name="柱状统计" data-value="Hui-iconfont-tongji-zhu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tongji-xian" data-name="线状统计" data-value="Hui-iconfont-tongji-xian"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-paixingbang" data-name="排行榜" data-value="Hui-iconfont-paixingbang"></i></li>
    </ul>
    <h2>箭头相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-arrow1-bottom" data-name="向左" data-value="Hui-iconfont-arrow1-bottom"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow1-bottom" data-name="向下" data-value="Hui-iconfont-arrow1-bottom"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow1-top" data-name="向上" data-value="Hui-iconfont-arrow1-top"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow1-right" data-name="向右" data-value="Hui-iconfont-arrow1-right"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow2-left" data-name="向左" data-value="Hui-iconfont-arrow2-left"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow2-top" data-name="向上" data-value="Hui-iconfont-arrow2-top"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow2-right" data-name="向右" data-value="Hui-iconfont-arrow2-right"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow2-bottom" data-name="向下" data-value="Hui-iconfont-arrow2-bottom"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow3-left" data-name="向左" data-value="Hui-iconfont-arrow3-left"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow3-top" data-name="向上" data-value="Hui-iconfont-arrow3-top"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow3-right" data-name="向右" data-value="Hui-iconfont-arrow3-right"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-arrow3-bottom" data-name="向下" data-value="Hui-iconfont-arrow3-bottom"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-sanjiao" data-name="向右" data-value="Hui-iconfont-sanjiao"></i></li>
    </ul>
    <h2>电商相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-wuliu" data-name="物流" data-value="Hui-iconfont-wuliu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-dianpu" data-name="店铺" data-value="Hui-iconfont-dianpu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cart2-selected" data-name="购物车" data-value="Hui-iconfont-cart2-selected"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cart2-man" data-name="购物车满" data-value="Hui-iconfont-cart2-man"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-card2-kong" data-name="购物车空" data-value="Hui-iconfont-card2-kong"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cart-selected" data-name="购物车-选中" data-value="Hui-iconfont-cart-selected"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cart-kong" data-name="购物车" data-value="Hui-iconfont-cart-kong"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jiangjia" data-name="降价" data-value="Hui-iconfont-jiangjia"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-bank" data-name="信用卡还款" data-value="Hui-iconfont-bank"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-liwu" data-name="礼物" data-value="Hui-iconfont-liwu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-youhuiquan" data-name="优惠券" data-value="Hui-iconfont-youhuiquan"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-hongbao" data-name="红包" data-value="Hui-iconfont-hongbao"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-hongbao2" data-name="优惠券" data-value="Hui-iconfont-hongbao2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-money" data-name="资金" data-value="Hui-iconfont-money"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-goods" data-name="商品" data-value="Hui-iconfont-goods"></i></li>
    </ul>
    <h2>编辑器</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-code" data-name="code" data-value="Hui-iconfont-code"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-align-left" data-name="左对齐" data-value="Hui-iconfont-align-left"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-align-center" data-name="居中对齐" data-value="Hui-iconfont-align-center"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-align-right" data-name="右对齐" data-value="Hui-iconfont-align-right"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-align-justify" data-name="两头对齐" data-value="Hui-iconfont-align-justify"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-font" data-name="字体" data-value="Hui-iconfont-font"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-bold" data-name="加粗" data-value="Hui-iconfont-bold"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-italic" data-name="倾斜" data-value="Hui-iconfont-italic"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-underline" data-name="下划线" data-value="Hui-iconfont-underline"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-text-height" data-name="text-height" data-value="Hui-iconfont-text-height"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-text-width" data-name="text-width" data-value="Hui-iconfont-text-width"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-link" data-name="link" data-value="Hui-iconfont-link"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-ordered-list" data-name="有序列表" data-value="Hui-iconfont-ordered-list"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-unordered-list" data-name="无序列表" data-value="Hui-iconfont-unordered-list"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cut" data-name="剪切" data-value="Hui-iconfont-cut"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-copy" data-name="复制" data-value="Hui-iconfont-copy"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-paste" data-name="粘贴" data-value="Hui-iconfont-paste"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-new" data-name="新建" data-value="Hui-iconfont-new"></i></li>
    </ul>
    <h2>银行、支付相关</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-pay-alipay-1" data-name="支付宝支付1" data-value="Hui-iconfont-pay-alipay-1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-pay-alipay-2" data-name="支付宝支付2" data-value="Hui-iconfont-pay-alipay-2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-pay-weixin" data-name="微信支付" data-value="Hui-iconfont-pay-weixin"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhongguoyinxing" data-name="中国银行" data-value="Hui-iconfont-zhongguoyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-gongshangyinxing" data-name="工商银行" data-value="Hui-iconfont-gongshangyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jiansheyinxing" data-name="建设银行" data-value="Hui-iconfont-jiansheyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jiaotongyinxing" data-name="交通银行" data-value="Hui-iconfont-jiaotongyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhongguonongyeyinxing" data-name="中国农业银行" data-value="Hui-iconfont-zhongguonongyeyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-youzhengyinxing" data-name="邮政银行" data-value="Hui-iconfont-youzhengyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-pufayinxing" data-name="浦发银行" data-value="Hui-iconfont-pufayinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-huaxiayinxing" data-name="华夏银行" data-value="Hui-iconfont-huaxiayinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhaoshangyinxing" data-name="招商银行" data-value="Hui-iconfont-zhaoshangyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhongxinyinxing" data-name="中信银行" data-value="Hui-iconfont-zhongxinyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shanghaiyinxing" data-name="上海银行" data-value="Hui-iconfont-shanghaiyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-wenzhouyinxing" data-name="温州银行" data-value="Hui-iconfont-wenzhouyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-guangdayinxing" data-name="光大银行" data-value="Hui-iconfont-guangdayinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-minshengyinxing" data-name="民生银行" data-value="Hui-iconfont-minshengyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-qingdaoyinxing" data-name="青岛银行" data-value="Hui-iconfont-qingdaoyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-beijingyinxing" data-name="北京银行" data-value="Hui-iconfont-beijingyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-guangdongfazhanyinxing" data-name="广东发展银行" data-value="Hui-iconfont-guangdongfazhanyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zheshangyinxing" data-name="浙商银行" data-value="Hui-iconfont-zheshangyinxing"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-cdbank" data-name="成都银行" data-value="Hui-iconfont-cdbank"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-hangzhouyinxing" data-name="杭州银行" data-value="Hui-iconfont-hangzhouyinxing"></i></li>
    </ul>
    <h2>其他</h2>
    <ul class="icon_lists cl">
        <li><i class="Hui-iconfont Hui-iconfont-tel" data-name="电话" data-value="Hui-iconfont-tel"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-tel2" data-name="电话" data-value="Hui-iconfont-tel2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-phone" data-name="iphone手机" data-value="Hui-iconfont-phone"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-phone-android" data-name="安卓手机" data-value="Hui-iconfont-phone-android"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-pad" data-name="平板电脑" data-value="Hui-iconfont-pad"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-xianshiqi" data-name="PC" data-value="Hui-iconfont-xianshiqi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhaoxiangji" data-name="照相机" data-value="Hui-iconfont-zhaoxiangji"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-danfanxiangji" data-name="单反相机" data-value="Hui-iconfont-danfanxiangji"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-dayinji" data-name="打印机" data-value="Hui-iconfont-dayinji"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-lunzi" data-name="轮胎" data-value="Hui-iconfont-lunzi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-chajian" data-name="插件" data-value="Hui-iconfont-chajian"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-jieri" data-name="节日" data-value="Hui-iconfont-jieri"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-paixu" data-name="排序" data-value="Hui-iconfont-paixu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-niming" data-name="匿名" data-value="Hui-iconfont-niming"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-pifu" data-name="换肤" data-value="Hui-iconfont-pifu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-2code" data-name="二维码" data-value="Hui-iconfont-2code"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-saoyisao" data-name="扫一扫" data-value="Hui-iconfont-saoyisao"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-search" data-name="搜索" data-value="Hui-iconfont-search"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-zhongtumoshi" data-name="中图模式" data-value="Hui-iconfont-zhongtumoshi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-datumoshi" data-name="大图模式" data-value="Hui-iconfont-datumoshi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-bigpic" data-name="大图模式" data-value="Hui-iconfont-bigpic"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-middle" data-name="中图模式" data-value="Hui-iconfont-middle"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-list" data-name="列表模式" data-value="Hui-iconfont-list"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-shijian" data-name="时间" data-value="Hui-iconfont-shijian"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-more2" data-name="更多" data-value="Hui-iconfont-more2"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-sim" data-name="SIM卡" data-value="Hui-iconfont-sim"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-hot" data-name="火热" data-value="Hui-iconfont-hot"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-paishe" data-name="拍摄" data-value="Hui-iconfont-paishe"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-hot1" data-name="热销" data-value="Hui-iconfont-hot1"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-new" data-name="上新" data-value="Hui-iconfont-new"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-canshu" data-name="产品参数" data-value="Hui-iconfont-canshu"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-dingwei" data-name="定位" data-value="Hui-iconfont-dingwei"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-weizhi" data-name="定位" data-value="Hui-iconfont-weizhi"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-html" data-name="HTML" data-value="Hui-iconfont-html"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-css" data-name="CSS" data-value="Hui-iconfont-css"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-apple" data-name="苹果" data-value="Hui-iconfont-apple"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-android" data-name="android" data-value="Hui-iconfont-android"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-github" data-name="github" data-value="Hui-iconfont-github"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-html5" data-name="html5" data-value="Hui-iconfont-html5"></i></li>
        <li><i class="Hui-iconfont Hui-iconfont-huangguan" data-name="皇冠" data-value="Hui-iconfont-huangguan"></i></li>
    </ul>
</div>
<@footer>
    <script type="text/javascript">
        $(function(){
            $('.Hui-iconfont').dblclick(function(){
                parent.$('#icon').val($(this).attr('data-value'));
                parent.$('#icon').prev().html($(this).attr('data-value') + ' ' + $(this).attr('data-name'));
                parent.$('#icon').prev().prev().addClass($(this).attr('data-value'));
                layer_close();
            });
        });
    </script>
</@footer>