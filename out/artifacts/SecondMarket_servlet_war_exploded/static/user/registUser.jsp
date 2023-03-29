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
            background-color: #f9d4a0;
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }

        .formBox {
            width: 358px;
            height: 500px;
            border-radius: 15px;
            padding: 0 50px;
            position: relative;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            background-color:  rgb(226, 240, 252);
            opacity: 0.9;
            text-align: center;
            vertical-align: middle;
        }

        .header {
            font-size: 38px;
            font-weight: bold;
            text-align: center;
            line-height: 80px;
            color: black;
        }

        input {
            width: 100%;
            height: 50px;
            position: relative;
            outline: none;
            border: none;
            box-sizing: border-box;
            padding-left: 5px;
            background-color: white;
            color: black;
            caret-color: #61dafb;
            margin-bottom: 30px;
            border-radius: 5px;
        }


    </style>
</head>
<body>
<div class="login1">
    <div class="formBox">
        <form class="register">
            <div class="header">用户注册</div>
            <input type="text" id="phone" name="phone" placeholder="请输入你的电话号码" class="phone"
                   onblur="userRegitPho()"/><br>
            <span class="msg" style="height: 20px"></span>
            <input type="password" name="pwd" placeholder="请输入你的密码" class="pwd"><br>
            <span class="pwd1" style="height: 20px"></span>
            <input type="password" name="pwdAgain" placeholder="请确认你的密码" class="pwdAgain"><br>
            <input type="text" name="captcha" class="captcha" placeholder="请输入验证码" style="width: 70%"><input
                type="button" id="gain" value="点击获取" style="width: 30%">
            <span class="captcha1" style="height: 20px"></span>
            <input type="button" class="btn" value="点击注册">
        </form>
    </div>
</div>
<script src="../../js/jquery-3.6.3.min.js"></script>
<script>
    let p = ''
    $('#gain').on('click', function (e) {
        p = ''
        for (let i = 0; i < 4; i++) {
            p = p + Math.floor(Math.random() * 10)
        }
        $('#gain').val(p)
    })

    function userRegitPho() {
        let phone = $('.phone').val()
        console.log(phone)
        let data = {'phone': phone}

        $.ajax({
            type: 'post',
            url: 'UserServlet?method=verify',
            data: data,
            dataType: 'json',
            success: function (data) {
                if (data == true) {
                    $('#phone').css('margin-bottom', '10px')

                    $('.msg').text('可以注册的手机号')
                    $('.msg').css('color', 'green')
                    $('.btn').removeAttr('disabled')
                } else {
                    $('#phone').css('margin-bottom', '10px')
                    $('.msg').text('该手机号码已经被注册过了，请重新输入')
                    $('.msg').css('color', 'red')
                    $('.btn').attr('disabled', 'true')
                }
            }
        })
    }

    $('.btn').on('click', function (e) {
        const pwd = $('.pwd').val()
        const phone = $('.phone').val()
        const pwdAgain = $('.pwdAgain').val()
        const captcha = $('.captcha').val()
        console.log(pwd + ":" + pwdAgain + ":" + captcha)
        if (pwd == pwdAgain) {
            $('.pwd').css('margin-bottom', '30px')
            $('.pwd1').text('')
            if (captcha == p) {
                $('.captcha1').text('')

                /*获取表单中的数据进行json数据封装*/
                let data = {'phone': phone, 'pwd': pwd}
                $.ajax({
                    type: 'post',
                    url: 'UserServlet?method=register',
                    data: data,
                    dataType: 'json',
                    success: function (data) {
                        console.log(data.msg)
                        console.log(data.num)
                        if (data.num > 0) {
                            /*$('.register').attr('visibility','hidden')*/
                            this.success("恭喜你注册成功")
                            window.location.href = 'static/login.jsp'
                        }
                    },
                    error: function (data) {
                        alert('注册失败' + data.status)
                    }
                })
            } else {
                $('.captcha1').text('验证码输入错误')
                $('.captcha1').css('color', 'red')
                $('.captcha').val('')
            }
        } else {
            $('.pwd').css('margin-bottom', '10px')
            $('.pwd1').text('两次输入的密码不一致，请重新输入')
            $('.pwd1').css('color', 'red')
            $('.pwd').val('')
            $('.pwdAgain').val('')

        }
    })
</script>
</body>
</html>
