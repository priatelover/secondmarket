<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/4
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <base href="<%=basePath %>"/>
    <title></title>
    <style>
        table {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }

        table td, table th {
            border: 1px solid #cad9ea;
            color: #666;
            height: 40px;
        }

        table thead th {
            background-color: #CCE8EB;
            width: 150px;
        }

        table tr:nth-child(odd) {
            background: #fff;
        }

        table tr:nth-child(even) {
            background: #F5FAFA;
        }

        .search input {
            width: 25%;
            height: 30px;
            margin-left: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .page {
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: center;
            padding-top: 15px;
        }

        .pageNum {
            width: 20px;
            height: 20px;
            border: 1px solid black;
            background-color: white;
            text-align: center;
        }
    </style>
</head>
<body>
订单信息列表:
一共有${orderCount}条订单。
<div>
    <form class="search" action="AdminUserServlet?method=search" method="post">
        <input type="text" name="username" placeholder="请输入姓名关键字" value=""/>
        <input type="text" name="phone" placeholder="请输入电话" value=""/>
        <input type="text" name="gender" placeholder="请输入性别" value=""/>
        <input type="submit" value="点击搜索" class="btn" style="width: 70px;border-radius: 10px"/>
    </form>
    <table class="table" width="100%">
        <thead>
        <td>订单编号</td>
        <td>商品编号</td>
        <td>商品名称</td>
        <td>商品类型</td>
        <td>商品数量</td>
        <td>商品单价</td>
        <td>下单时间</td>
        <td>订单总价格</td>
        <td>订单状态</td>
        <td>操作</td>
        <c:forEach items="${orderList}" var="order">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.goodsId}</td>
                <td>${order.goodsName}</td>
                <td>${order.goodsType}</td>
                <td>${order.orderNum}</td>
                <td>${order.price}</td>
                <td>${order.orderTime}</td>
                <td>${order.orderNum*order.price}</td>
                <td>${order.orderStatus}</td>
                <td>
                    <a href="javascript:deleteRow(${order.orderId})">删除</a>
                    <a href="javascript:updateRow(${order.orderId})">编辑</a>
                </td>
            </tr>
        </c:forEach>
        </thead>
    </table>
    <div class="page">
        <c:forEach var="i" begin="1" end="${orderCount%10==0?orderCount/10:orderCount/10+1}">
            <button class="pageNum">${i}</button>
        </c:forEach>
    </div>
</div>
<script src="../../js/jquery-3.6.3.min.js"></script>
<script>
    $('.pageNum').on('click', function (e) {
        let i = $(this).text()
        window.location.href='AdminOrderServlet?method=pagination&page='+i
    })
</script>
</body>
</html>
