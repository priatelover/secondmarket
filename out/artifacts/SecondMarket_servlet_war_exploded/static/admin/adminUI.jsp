<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/4
  Time: 22:44
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<%=basePath %>"/>
    <title>后台管理界面</title>
    <style>
        *{
            margin: 0;
            padding: 0;
        }
        html, body {
            height: 100%;
        }
        .box{
            width: 100%;
            height: 100%;
        }
        .left{
            float: left;
            width: 22%;
            height: 100%;
            background-color: #ffffff;
        }
        .right{
            float: left;
            width: 78%;
            height: 100%;
            background-color: #e2f0fc;
        }
        li{
            display: block;
            list-style: none;
            height: 50px;
            color: black;
            font-weight: 700;
            border-bottom: 1px solid black;
            line-height: 50px;
            padding-left: 20px;
        }
        a{
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>
<div class="box">
    <div class="left">
        <ul>
            <li><a href="static/admin/home.jsp" target="info">首页</a></li>
            <li><a href="static/admin/userInfo.jsp " target="info">用户信息管理</a></li>
            <li><a href="static/admin/goodsInfo.jsp" target="info">商品信息管理</a></li>
            <li><a href="AdminOrderServlet" target="info" class="order">订单信息管理</a></li>
            <li><a href="static/admin/privateInfo.jsp" target="info">个人中心</a></li>
        </ul>
    </div>
    <div class="right">
        <iframe style="width: 100%;height: 100%;border: 0" name="info">
        </iframe>
    </div>
</div>
<script src="../../js/jquery-3.6.3.min.js"></script>
<script>

</script>
</body>
</html>
