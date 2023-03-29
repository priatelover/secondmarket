<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/6
  Time: 12:11
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
    <title></title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        .private {
            border: 1px solid black;
            width: 80%;
            height: 100px;
            line-height: 100px;
            margin: 5% auto;
            border-radius: 15px;
            background-color: #9ae3f8;
        }

        form {
            width: 80%;
            text-align: center;
            background-color: #B6B6B6;
            border: 1px solid black;
            border-radius: 15px;
            margin: 0 auto;

        }

        label {
            display: block;
            width: 100%;
        }

        input {
            margin-top: 15px;
            margin-bottom: 15px;
            width: 80%;
            height: 30px;
        }
    </style>
</head>
<body>

<div>
    <div class="private">
        <img src="/static/img/个人头像.png" style="height: 80%;position: relative;left: 1%;top: 10%" alt="" class="edit">
        <span style="position: relative;left: 30%;bottom: 30%">个人中心</span>
        <img src="/static/img/管理.png" style="position: relative;right: -75%;height: 40%;bottom: 42%" alt="设置" class="edit">
    </div>
    <form>
        <label>编号：
            <input type="text" value="${admin.adminId}">
        </label>
        <label>姓名：
            <input type="text" value="${admin.name}">
        </label>
        <label>电话：
            <input type="text" value="${admin.phone}">
        </label>
        <label>等级：
            <input type="text" value="${admin.status}">
        </label>
        <label>密码：
            <input type="text" value="${admin.password}">
        </label>
        <label>性别：
            <input type="text" value="${admin.gender}">
        </label>
    </form>
</div>
<script>
    const edit = document.querySelector(".edit")
    const form = document.querySelector("form")
    let a = 'hidden'
    let flag = true
    form.style.visibility = a
    edit.addEventListener('click', function (e) {
        if (flag){
            flag=!flag
            form.style.visibility = ''
        }else{
            flag=!flag
            form.style.visibility =a
        }

    })
</script>
</body>
</html>
