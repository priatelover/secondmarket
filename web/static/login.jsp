<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/4
  Time: 18:46
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
    <title>用户登陆界面</title>
    <style>
        * {
            padding: 0;
            margin: 0;
        }

        html, body {
            height: 100%;
        }

        .login1 {
            width: 100%;
            height: 100%;
            background-color: #f2cd99;
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        .login {
            width: 358px;
            height: 600px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color: rgb(226, 240, 252);
            text-align: center;
            vertical-align: middle;
        }

        .header {
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            line-height: 180px;
            color: black;
        }

        input {
            width: 100%;
            height: 50px;
            position: relative;
            outline: none;
            box-sizing: border-box;
            padding-left: 5px;
            background-color: white;
            border: 1px solid #DBC395;
            color: black;
            caret-color: #61dafb;
            margin-bottom: 30px;
            border-radius: 5px;
        }

        input::placeholder {
            color: black;
        }

        .btn {
            width: 50%;
        }

    </style>
</head>
<body>
<div class="login1">
    <div class="login">
        <form action="AdminLoginServlet" method="post">
            <div class="header">登录</div>
            <input type="text" placeholder="请输入用户账号/电话号码" value="" name="phone" class="phone">
            <input type="password" placeholder="请输入密码" value="" name="pwd" class="pwd">
            请选择你的角色：<input type="radio" name="role" style="width: 20%;height: 20px;" class="role" value="1" checked>管理员
            <input type="radio" name="role" style="width: 20%;height: 20px" value="2" class="role">用户
            <input type="text" id="captcha" placeholder="请输入验证码" style="width: 50%" ><img src="../static/img.jsp" style="width: 46%;height: 50px">
            <span class="pd"></span>
            <input type="submit" value="登录" class="btn">
        </form>
    </div>
</div>
<script src="../js/jquery-3.6.3.min.js"></script>
<script>
        <%--function captchaT() {--%>


        // onblur="captchaT()"



        <%--    let text = $('#captcha').val()--%>
        <%--    console.log(text)--%>
        <%--    if (text=='${rand}'){--%>
        <%--        console.log(text)--%>
        <%--        $('.pd').text('验证码正确')--%>
        <%--        $('.btn').attr('disabled','false')--%>
        <%--    }else {--%>
        <%--        console.log(text)--%>
        <%--        console.log('${rand}')--%>
        <%--        $('.pd').text('验证码错误')--%>
        <%--        $('.btn').attr('disabled','true')--%>
        <%--    }--%>
        <%--    console.log(111)--%>
        <%--}--%>
</script>
<%--
<script src="../js/jquery-3.6.3.min.js"></script>
<script>
    const btn = document.querySelector('.btn')
    btn.addEventListener('click', function (e) {
        let role = $('input:radio:checked').val()
        const phone = $('.phone').val()
        const pwd = $('.pwd').val()
        console.log(phone+":"+pwd)
        const data = {'phone':phone,'pwd':pwd}
        url=''
        if (role==1){
            url='AdminLoginServlet'
        }else {
            url='UserServlet'
        }

        $.ajax({
            type:'post',
            url:url,
            data:data,
            dataType:'json',

        })
    })
--%>
<%--</script>--%>
</body>
</html>
