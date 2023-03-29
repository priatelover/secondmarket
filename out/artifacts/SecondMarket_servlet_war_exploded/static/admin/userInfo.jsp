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
<label>用户信息列表:</label>
<form class="search" action="AdminUserServlet?method=search" method="post">
    <input type="text" name="username" placeholder="请输入姓名关键字" value=""/>
    <input type="text" name="phone" placeholder="请输入电话" value=""/>
    <input type="text" name="gender" placeholder="请输入性别" value=""/>
    <input type="submit" value="点击搜索" class="btn" style="width: 70px;border-radius: 10px" />
</form>
<table class="table" width="100%" >
    <thead>
    <td>用户编号</td>
    <td>用户姓名</td>
    <td>用户电话</td>
    <td>用户密码</td>
    <td>用户性别</td>
    <td>用户状态(0:可用 1:禁用)</td>
    <td>操作</td>
    <c:forEach items="${userList}" var="user">
        <tr>
            <td>${user.userId}</td>
            <td>${user.username}</td>
            <td>${user.phone}</td>
            <td>${user.password}</td>
            <td>${user.gender}</td>
            <td>${user.status}</td>
            <td>
                <a href="javascript:deleteRow(${user.userId})">删除</a>
                <a href="javascript:updateRow(${user.userId})">编辑</a>
            </td>
        </tr>
    </c:forEach>
    </thead>
</table>
<script>
    function deleteRow(id){
        if (window.confirm("确定要删除吗")){
            window.location.href = 'AdminUserServlet?method=delete&userId='+id
        }
    }
    function updateRow(id) {
        window.location.href = 'AdminUserServlet?method=update&userId='+id
    }
</script>
</body>
</html>
