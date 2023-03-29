<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/4
  Time: 23:28
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
        .search input{
            width: 25%;
            height: 30px;
            margin-left: 10px;
            margin-top: 10px;
            margin-bottom: 10px;
        }

    </style>
</head>
<body>
<label>商品信息列表:</label><br>
<label>当前共有${goodsList.size()}</label><br>

<form class="search" action="AdminGoodsServlet?method=search" method="post">
    <input type="text" name="goodsName" placeholder="请输入商品关键字" value=""/>
    <input type="text" name="price" placeholder="请输入商品最高价格" value=""/>
    <input type="text" name="type" placeholder="请输入商品类型" value=""/>
    <input type="submit" value="点击搜索" class="btn" style="width: 70px;border-radius: 10px" />
</form>
<table class="table" width="100%" >
    <thead>
    <td>商品Id</td>
    <td>商品编号</td>
    <td>商品名</td>
    <td>商品类型</td>
    <td>商品单价</td>

    <td>操作</td>
    <c:forEach items="${goodsList}" var="goods">
        <tr>
            <td>${goods.goodsId}</td>
            <td>${goods.goodsNum}</td>
            <td>${goods.goodsName}</td>
            <td>${goods.goodsType}</td>
            <td>${goods.price}</td>
            <td>
                <a href="javascript:deleteRow(${goods.goodsId})">删除</a>
                <a href="javascript:updateRow(${goods.goodsId})">编辑</a>
            </td>
        </tr>
    </c:forEach>
    </thead>
</table>
<div>

</div>
<script>
    function deleteRow(id){
        if (window.confirm("确定要删除吗")){
            window.location.href = 'AdminGoodsServlet?method=delete&goodsId='+id
        }
    }
    function updateRow(id) {
        window.location.href = 'AdminGoodsServlet?method=update&goodsId='+id
    }
</script>
</body>
</html>

