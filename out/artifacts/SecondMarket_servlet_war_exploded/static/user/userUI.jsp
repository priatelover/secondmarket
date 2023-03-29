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
            background-color: rgba(248, 221, 194, 0.69);
        }
        .right{
            float: left;
            width: 78%;
            height: 100%;
            background-color:white;
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
            <li>首页</li>
            <li>商品列表
                <ul>
                    <li>商品分类</li>
                </ul>
            </li>
            <li>商品信息管理</li>
            <li>订单信息管理</li>
            <li>个人中心</li>
        </ul>
    </div>
    <div class="right">
        <iframe style="width: 100%;height: 100%;border: 0" name="info">
        </iframe>
    </div>
</div>
</body>
</html>
