<%--
  Created by IntelliJ IDEA.
  User: lyh
  Date: 2018/7/2
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>租车网</title>
    <link rel="stylesheet" type="text/css" href="css/semantic.css"/>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <%--<link rel="stylesheet" type="text/css" href="css/new_file.css"/>--%>
    <script src="layui/layui.js"></script>

    <script>
        //注意：导航 依赖 element 模块，否则无法进行功能性操作
        layui.use(['carousel', 'form'], function () {

            var carousel = layui.carousel;
            form = layui.form;

            //建造实例
            carousel.render({
                elem: '#lunbo'
                , width: '100%' //设置容器宽度
                , arrow: 'always' //始终显示箭头
                , anim: 'updown' //切换动画方式
            });
            //图片轮播
            carousel.render({
                elem: '#lunbo'
                , width: '1140px'
                , height: '550px'
                , interval: 5000
            });

            //…
        });


        layui.use('element', function () {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function (elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });


        layui.use('rate', function () {
            var rate = layui.rate;

            //渲染
            var ins1 = rate.render({
                elem: '#banxin,#banxin1,#banxin2,#banxin3,#banxin4,#banxin5,#banxin6,#banxin7,#banxin8,#banxin9,#banxin10,#banxin11'//绑定元素
                , value: 2.5 //初始值
                , half: true //开启半星
                , readonly: true
            });
        });


    </script>

</head>

<body>


<div class="layui-container">

    <%--导航包括拦--%>
    <%@include file="nav.jsp" %>


    <%--轮播组件--%>

    <div class="layui-carousel " id="lunbo">
        <div carousel-item="">
            <div><img src="images/car1.jpg"></div>
            <div><img src="images/car2.jpg"></div>
            <div><img src="images/car3.jpg"></div>
            <div><img src="images/car4.jpg"></div>

        </div>
    </div>
</div>
<%--车型界面--%>
<div class="ui  segment basic container ">


    <div class="ui celled grid">

        <%--左侧显示--%>

        <div class="twelve wide column segment right">
            <span>
                <h2 class="ui basic blue header">
                    <i class="car icon"></i>
                    <div class="content">
                        热门车型
                    </div>
                </h2>
            </span>
            <div class="ui three  column grid">
                <div class="row">
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin1"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin2"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin3"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui three  column grid">
                <div class="row">
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin4"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin5"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin6"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin7"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="ui three  column grid">
                <div class="row">
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin8"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                    <span class=" floated">
                                        <i class="users outline  icon"></i> 月租量XX
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin9"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                <span class=" floated">
                                    <i class="users outline  icon"></i> 月租量XX
                                </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin10"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                    <span class=" floated">
                                        <i class="users outline  icon"></i> 月租量XX
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="four wide column">
                        <div class="ui card">
                            <div class="image">
                                <img src="images/car1.jpg">
                            </div>
                            <div class="content">
                                <a class="header">东风标致208</a>
                            </div>
                            <div class="extra content">
                                <ul>
                                    <li>
                                        <div id="banxin11"></div>
                                    </li>
                                </ul>
                                <div class="content">
                                    <span class=" floated">
                                        <i class="users outline  icon"></i> 月租量XX
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <%--右侧特价推荐--%>

        <div class="four wide column">
            <div class="ui card">
                <div class="content">
                    <div class="right floated meta">14h</div>
                    <img class="ui avatar image" src="images/car1.jpg"> 特价车型
                </div>
                <div class="image">
                    <img src="images/car1.jpg">
                </div>
                <div class="content">
                    <span class="right floated">
                    <i class="heart outline like icon"></i> 17 likes
                    </span> <i class="car icon"></i> 3 台已租
                </div>

            </div>

            <div class="ui card">
                <div class="content">
                    <div class="right floated meta">14h</div>
                    <img class="ui avatar image" src="images/car2.jpg"> 特价车型
                </div>
                <div class="image">
                    <img src="images/car2.jpg">
                </div>
                <div class="content">
                    <span class="right floated">
                    <i class="heart outline like icon"></i> 17 likes
                    </span> <i class="car icon"></i> 3 台已租
                </div>

            </div>

            <div class="ui card">
                <div class="content">
                    <div class="right floated meta">14h</div>
                    <img class="ui avatar image" src="images/car3.jpg"> 特价车型
                </div>
                <div class="image">
                    <img src="images/car3.jpg">
                </div>
                <div class="content">
                    <span class="right floated">
                    <i class="heart outline like icon"></i> 17 likes
                    </span> <i class="car icon"></i> 3 台已租
                </div>

            </div>

        </div>

    </div>

</div>
<%--底部--%>
<div class="ui  segment container">
    <span>
        <h2 class="ui basic blue header">
                <i class="Call Square  icon basic"></i>
                <div class="content basic">接送服务</div>
        </h2>
    </span>
    <div class="ui four attached buttons">
        <button class="fluid massive basic blue ui button">
            <i class="ui icon sun"></i>日租
        </button>
        <button class="fluid massive basic blue ui button">
            <i class="ui icon star"></i>月租
        </button>
        <button class="fluid massive basic blue ui button">
            <i class="ui icon car"></i>接送
        </button>
        <button class="fluid massive basic blue ui button">
            <i class="ui icon plane"></i>
            送机
        </button>
    </div>


</div>

<%--底部信息--%>
<div class="ui segment basic container">
    <div class="ui vertical  very padded segment">
        <div class="ui container">

            <div class="ui divider"></div>

            <div class="ui six column grid">
                <div class="column">
                    <div class="ui vertical   text menu">
                        <a class="item">
                            关于我们
                        </a>
                    </div>
                </div>
                <div class="column">
                    <div class="ui vertical   text menu">
                        <a class="item">
                            产品博客
                        </a>
                    </div>
                </div>
                <div class="column">
                    <div class="ui vertical   text menu">
                        <a class="item">
                            加入我们
                        </a>
                    </div>
                </div>
                <div class="column">
                    <div class="ui vertical   text menu">
                        <a class="item">
                            商务合作
                        </a>
                    </div>
                </div>
                <div class="column">
                    <div class="ui vertical   text menu">
                        <h5 class="item">
                            客服支持QQ:123456789
                        </h5>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

</body>

</html>