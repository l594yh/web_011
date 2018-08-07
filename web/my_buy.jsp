<%--
  Created by IntelliJ IDEA.
  User: lyh
  Date: 2018/7/4
  Time: 15:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
                , height: '540px'
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
    <%--下面是一个导航栏--%>
    <%--导航包括拦--%>
    <%@include file="nav.jsp" %>


    <%--个人页面--%>
    <div class="ui  raised container segments">
        <div class="ui head basic segment"
             style="background-image: url('images/bg.png');background-repeat: no-repeat;-webkit-background-size: cover;height: 150px"></div>
        <div class="ui bottom inverted  six item attached menu">

            <div class="item">
                <a href="pif.jsp">个人资料</a>
            </div>
            <div class="active item">
                <a href="my_buy.jsp">我的订单</a>
            </div>
        </div>

        <div class="ui segment container basic" style="padding-left: 200px;padding-right: 200px">

            <div class="ui internally celled grid">
                <div class="row">
                    <div class="six wide column">
                        <img src="images/car1.jpg" style="height: auto;width: auto">
                    </div>
                    <div class="ten wide column">
                        <p>订单号：20156465789798</p>
                        <div class="ui divider"></div>
                        <p>车型信息：东风标致208</p>
                        <div class="ui divider"></div>
                        <p>租借日期：2018-09-28</p>
                        <div class="ui divider"></div>
                        <a>
                            <button class="ui basic button">阅读详情</button>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="six wide column">
                        <img src="images/car2.jpg" style="height: auto;width: auto">
                    </div>
                    <div class="ten wide column">
                        <p>订单号：20156465789798</p>
                        <div class="ui divider"></div>
                        <p>车型信息：东风标致208</p>
                        <div class="ui divider"></div>
                        <p>租借日期：2018-09-28</p>
                        <div class="ui divider"></div>
                        <a>
                            <button class="ui basic button">阅读详情</button>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="six wide column">
                        <img src="images/car3.jpg" style="height: auto;width: auto">
                    </div>
                    <div class="ten wide column">
                        <p>订单号：20156465789798</p>
                        <div class="ui divider"></div>
                        <p>车型信息：东风标致208</p>
                        <div class="ui divider"></div>
                        <p>租借日期：2018-09-28</p>
                        <div class="ui divider"></div>
                        <a>
                            <button class="ui basic button">阅读详情</button>
                        </a>
                    </div>
                </div>
            </div>

        </div>


    </div>


    <%--底部--%>
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
                                客服支持QQ:1234567890
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
