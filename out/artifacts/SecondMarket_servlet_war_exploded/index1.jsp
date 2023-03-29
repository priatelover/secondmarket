<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/11
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath %>"/>
    <title>Insert title here</title>


</head>
<body>
${path}
<div>
    <div class="nav">
        <div class="nav-c">
            <ul>
                <li style="color: red"><a href="static/login.jsp">亲，请登录</a></li>
                <li><a href="static/user/registUser.jsp">免费注册</a></li>
            </ul>
            <ul>
                <li>易当铺网首页</li>
                <li>购物车</li>
                <li>商品分类</li>
            </ul>
        </div>

    </div>
    <div class="search">
        <input type="text" style="width: 300px;height: 40px"><input type="button" class="searchBtn" value="搜索">
    </div>
    <div class="display-list">
        <c:forEach items="${goodsList}" var="goods">
            <div class="mini">
            <div style="width: 80%;margin: 5% auto">
                <img src="/static/img/goods/R-C.jpg" width="100%">
            </div>
                <div style="text-align: center">
                    <h5>商品编号：${goods.goodsNum}</h5>
                    <h5>商品名：${goods.goodsName}</h5>

                    <h5>价格：￥${goods.price}</h5>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
