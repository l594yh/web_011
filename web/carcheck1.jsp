<%--
  Created by IntelliJ IDEA.
  User: 小宝慕谭
  Date: 2018/7/4
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <%--下面是一个导航栏--%>
    <%--导航包括拦--%>
    <%@include file="nav.jsp" %>

    <!--以下是车型再选择-->
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div class="layui-row layui-col-space15">
            <div class="layui-col-md3">
                <div class="layui-card">
                    <div class="layui-card-header" style="padding: 5px; background-color: #6C6C6E;"><h1
                            style="color:#FFF;"><i class="fa fa-smile-o" aria-hidden="true"></i>车型选择</h1></div>
                    <div class="layui-card-body">

                        <%--包含左侧导航栏--%>
                        <%@ include file="catlog.jsp" %>

                    </div>
                </div>
            </div>

            <div class="layui-col-md9">
                <div class="layui-card">
                    <div class="layui-card-header" style="padding: 5px; background-color: #FF5C01;"><h1
                            style="color:#FFF;"><i class="fa fa-heart-o" aria-hidden="true"></i>车型</h1></div>
                    <div class="layui-card-body" id="searchResult">



                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="copyright">
        <div class="container">
            <hr class="layui-bg-orange">
            <div class="row" style="text-align: center">
                <div class="col-sm-12">
                    <span>Copyright &copy; 2018 <a href="#">租车网演示</a></span>
                    | <span><a href="http://www.miibeian.gov.cn/"
                               target="_blank">陕ICP备17021699号</a></span> | 联系站长：<a href="mailto:403353606@qq.com">
                    管理员 </a>

                </div>
            </div>
        </div>
    </div>

</div>


<script>
    //一般直接写在一个js文件中
    layui.use(['layer', 'element', 'form', 'laydate'], function () {
        var layer = layui.layer
            , form = layui.form;
        var element = layui.element;
        var laydate = layui.laydate;
        //获得jquery

        var $ = layui.jquery;

        //常规用法
        laydate.render({
            elem: '#test1'
        });

        //监听导航点击
        element.on('nav(demo)', function (elem) {
            //console.log(elem)
            var id = elem.attr('id');
            layer.msg(id);
            //layer.msg(elem);
        });


        function GetQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if (r != null) return unescape(decodeURI(r[2]));
            return null;
        }


        //如何获得页面传过来的参数呢？type='轿车'，我是不是要获得这个轿车参数。
        var type = GetQueryString('type')

        //layer.msg(type);

        //发送异步请求。
        $.ajax({
            type: 'POST',
            async: true,
            url: 'CarsServlet',
            data: {action: 'byType', type: type},
            success: function (msg) {
                // if(msg=='success'){
                //         layer.alert(msg,{title:'json数据'})
                //
                // }

                // alert(msg);


                $("#searchResult").empty(); //清空子元素;
                //再追加子元素。
                //var html = "<div><table class=\"layui-table\" lay-skin=\"nob\"><tr><td width=\"30%\"><dl><dt><img src=\"images/cars/"++"\" width=\"120\" height=\"120\"></dt><dd></dd></dl></td></tr></table></div>";
                var html = "";
                for (var i = 0; i < msg.length; i++) {
                    html += "<div class=\"layui-row\">\n" +
                        "<div class=\"layui-col-md6\">\n" +
                        "<dt><img src=\"images/" + msg[i].pic + "\" width=\"120\" height=\"120\"></dt>\n" +
                        "</div>\n" +
                        "<div class=\"layui-col-md6\">\n" +
                        "<p>\n" + msg[i].information + "<br>\n" + "价格" + msg[i].price + "/天" + "<br>\n" +
                        "</p>\n" +
                        "<br>\n" +
                        "<button class=\"layui-btn layui-btn-radius\"><a href=\"buys.jsp\">立即下单</a></button>\n" +
                        "</div>\n" +
                        "</div>";

                    // alert(msg[i].information);

                }

                $("#searchResult").append(html);
            },
            dataType: 'json'
        });

    });
</script>
</body>
</html>

