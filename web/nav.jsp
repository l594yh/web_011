<%--
  Created by IntelliJ IDEA.
  User: lyh
  Date: 2018/7/6
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<ul class="layui-nav" lay-filter="demo">
    <li class="layui-nav-item"><a href=""><img class="ui menu inverted images" src="images/logo.jpg"
                                               style="width: 120px;height: 60px"></a></li>
    <li class="layui-nav-item "><a href="index.jsp"><i class="home icon"></i>首页</a></li>
    <li class="layui-nav-item"><a href=""><i class="Browser icon"></i>公司简介</a></li>
    <li class="layui-nav-item">
        <a href="javascript:;"><i class="ui car icon"></i> 车型查询</a>
        <dl class="layui-nav-child"> <!-- 二级菜单 -->
            <dd><a href="carcheck1.jsp?type=轿车">轿车</a></dd>
            <dd><a href="carcheck1.jsp?type=SUV">SUV</a></dd>
            <dd><a href="carcheck1.jsp?type=MPV">MPV</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item"><a href=""><i class="ui icon alarm"></i> 租车事项</a></li>

    <c:choose>
        <c:when test="${sessionScope.loginUser==null}">
            <li class="layui-nav-item"><a href="login.jsp"><i class="user icon"></i>登录</a></li>

        </c:when>
        <c:otherwise>
            <li class="layui-nav-item">
                <a href="pif.jsp"><img src="images/hou30.jpg" class="layui-nav-img">${sessionScope.loginUser.username}</a>
                <dl class="layui-nav-child">
                    <dd><a href="my_buy.jsp">我的订单</a></dd>
                    <dd><a href="UsersServlet?action=logout">注销</a></dd>

                </dl>
            </li>
        </c:otherwise>
    </c:choose>
</ul>

