<%--
  Created by IntelliJ IDEA.
  User: lyh
  Date: 2018/7/7
  Time: 19:06
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


    <script>
        //一般直接写在一个js文件中
        layui.use(['layer', 'element', 'form', 'laydate'], function () {
            var layer = layui.layer
                , form = layui.form;
            var element = layui.element;
            var laydate = layui.laydate;
            //常规用法
            laydate.render({
                elem: '#test2'
            });

            //layui使用jquery
            var $ = layui.jquery;




            //监听提交
            form.on('submit(order)', function (data) {

                //把表单的数据转换为json格式的字符串。

                // layer.alert(JSON.stringify(data.field), {
                //     title: '最终的提交信息'
                // });
                //我们还是要异步提交表单

                $.ajax({
                    type: 'POST',
                    async: true,
                    url: 'orderServlet',
                    data: {action: 'order', data: JSON.stringify(data.field)},
                    success: function (msg) {
                        if (msg == 'success') {
                            layer.alert('恭喜您提交订单成功', {title: '提示信息'});
                            //把表单置空
                            $('#ordFrom')[0].reset();
                            //自动切换到用户登录的标签
                            //element.tabChange('docDemoTabBrief', 'login_tab');
                        } else {
                            layer.msg('提交失败！');
                        }

                    },
                    dataType: 'text'
                });

                return false;//阻止提交表单.
            });

        });
    </script>


</head>
<body>

<div class="layui-container">

    <%--包含导航--%>
    <%@ include file="nav.jsp" %>


    <div class="layui-col-md4 layui-col-md-offset4">
        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
            <div class="layui-tab-content" style="height:360px;">
                <div class="layui-tab-item layui-show">
                    <form id="ordFrom" class="layui-form" action="#" lay-filter="example">
                        <div class="layui-form-item">
                            <label class="layui-form-label">车辆品牌</label>
                            <div class="layui-input-block">
                                <select name="brand" lay-verify="required">
                                    <option value="">请选择车辆品牌</option>
                                    <option value="大众">大众</option>
                                    <option value="丰田">丰田</option>
                                    <option value="东风">东风</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label">车辆类型</label>
                            <div class="layui-input-block">
                                <select name="car_type" lay-verify="required">
                                    <option value="">请选择车辆类型</option>
                                    <option value="SUV">SUV</option>
                                    <option value="MPV">MPV</option>
                                    <option value="轿车">轿车</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">服务类型</label>
                            <div class="layui-input-block">
                                <select name="service" lay-verify="required">
                                    <option value="">请选择车辆类型</option>
                                    <option value="日租">日租</option>
                                    <option value="月租">月租</option>
                                    <option value="年租">年租</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <label class="layui-form-label">归还日期</label>
                            <div class="layui-input-block">
                                <input type="text" name="retday" lay-verify="required" class="layui-input" id="test2"
                                       placeholder="yyyy-MM-dd">
                            </div>
                        </div>


                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-submit="" lay-filter="order">提交订单</button>
                            </div>
                        </div>
                    </form>
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
</body>
</html>
