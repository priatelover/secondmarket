<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/4
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <base href="<%=basePath %>"/>
    <title>Document</title>
    <style>
        html {
            height: 100%;
        }

        body {
            height: 100%;
            background-color: #dcd9d9;
        }

        * {
            margin: 0;
            padding: 0;
        }

        .top {
            width: 100%;
            height: 15%;
            background-color: beige;
            line-height: 20%;
            position: relative;
        }

        .body {
            margin: 0 auto;
            background-color: white;
            width: 70%;
            height: 200%;

        }

        button {
            width: 8%;
            height: 40%;
            border-radius: 15px;
        }

        button:hover {
            background-color: #F5F5DC;

        }

        .logo {
            width: 10%;
            height: 60%;
            position: absolute;
            left: 15%;
            top: 20%;
        }

        .login {
            position: absolute;
            top: 30%;
            right: 14%;
            font-size: 25px;
        }

        .regist {
            position: absolute;
            top: 30%;
            right: 5%;
            font-size: 25px;
        }

        ul {
            display: block;
            width: 30%;
            position: absolute;
            left: 37%;
            top: 50%;
        }

        li {
            display: block;
            width: 25%;
            float: left;
            list-style: none;
            font-size: 25px;
        }

        .goodsType {
            width: 100%;
            height: 7%;
            background-color: #e7e7cb;
            display: none;
        }

        .itself {
            width: 5%;
            height: 70%;
            border-radius: 50px;
            border: 1px solid black;
            position: absolute;
            right: 10%;
            top: 15%;
            text-align: center;
            background-image: url("static/img/头像.png");
            background-size: 100% 100%;
        }

        .itself span {
            position: relative;
            top: 50%;
        }

        .mini {
            box-sizing: border-box;
            width: 25%;
            height: 480px;
            float: left;
            border: 1px solid #F5F5DC;
            border-radius: 15px;
            margin-top: 50px;
            display: block;
        }
        .mini:hover{

            border-right: 2px solid yellow;
            border-bottom: 2px solid yellow;
        }

        .btn div {
            box-sizing: border-box;
            width: 50%;
            float: left;
        }
        .msgInfo{
            width: 50%;
            height: 40px;
            margin-left: 50%;
            margin-top: 40px;
            background-color: #DCD9D9;
        }
        .goCart{
            width: 50%;
            height: 40px;
            margin-left: 15%;
            margin-top: 40px;
            background-color: #F5F5DC;
        }
        .itselfMsg{
            position: fixed;
            right: 5%;
            top: 13%;
            width: 15%;
            height: 500px;
            border: 1px solid black;
            border-radius: 15px;
            background-color: #F5F5DC;
            display: none;
        }
        .itselfMsg a{
            display: block;
        }
        .myCart{
            width: 98%;
            height: 300px;
            border: 1px solid yellow;
            border-radius: 15px;
            margin-top: 20px;

        }
        .photo{
            display: inline-block;
            width: 40%;
            height: 100%;

        }
        .photo img{
            height: 100%;

        }
        .cartMsg{
            display: inline-block;
            width: 40%;
            height: 100%;

        }
    </style>
</head>
<body>
<div style="width: 100%;height: 100%;">
    <div class="top">
        <div class="logo">
            <img src="/static/img/logo.png" alt="" style="width: 100%;height: 100%;border-radius: 50px">
        </div>
        <ul>
            <li class="home">首页</li>
            <li class="Cart">购物车</li>
            <li class="Type">商品分类</li>
            <li class="sell">我要出售</li>
        </ul>

        <c:if test="${user.phone == null}">
            <button class="login">登录</button>
            <button class="regist">注册</button>
        </c:if>
        <c:if test="${user.phone != null}">
            <div class="itself">
                <span>个人中心</span>
            </div>
        </c:if>
    </div>
    <hr width="100%">
    <div class="goodsType">
        <c:forEach items="${goodsType}" var="type">
            <span>${type.goodsType}</span>
        </c:forEach>
    </div>
    <div class="body">
        <c:forEach items="${goodsList}" var="goods">
            <div class="mini">
                <div style="width: 80%;margin: 5% auto;height: 270px">
                    <img src="images/${goods.imgPath}" width="100%" style="height: 100%">
                </div>
                <div style="text-align: center;font-size: 20px">
                    <h5>商品编号：${goods.goodsNum}</h5>
                    <h5>商品名：${goods.goodsName}</h5>
                    <h5>价格：￥${goods.price}</h5>
                </div>
                <div class="btn" style="width: 100%">
                    <div>
                        <button class="msgInfo">查看详情</button>
                    </div>
                    <div>
                        <button class="goCart" onclick="goCart(${goods.goodsId})">加入购物车</button>
                    </div>
                </div>
            </div>
        </c:forEach>
        <c:forEach items="${cartList}" var="cart">
            <div class="myCart">
            </div>
        </c:forEach>
    </div>
    <div class="itselfMsg">
            ${user}
        <a>个人信息</a>
        <a>我的订单</a>
        <a>购买记录</a>
        <a></a>
        <a>退出登录</a>
    </div>
</div>
<script src="/js/jquery-3.6.3.min.js"></script>
<script>
    $('.Type').on('click', function () {
        $(".goodsType").css('display', 'block')
    })
    $('.login').on('click', function (e) {
        window.location.href = 'static/login.jsp'
    })
    $('.regist').on('click', function (e) {
        window.location.href = 'static/user/registUser.jsp'
    })
    $('.sell').on('click', function (e) {
        if(${user.phone != null}){
        window.location.href = 'static/user/addGoods.jsp'
        }else {
            window.location.href ='static/login.jsp'
        }
    })
    $('.itself').on('mouseenter', function () {
        $(".itselfMsg").css('display', 'block')
    })
    $('.itselfMsg').on('mouseleave', function () {
        $(".itselfMsg").css('display', 'none')
    })
    let userId=${user.userId}
    //添加进入购物车
   function goCart(id){

       let data={'goodsId':id,'userId':'${user.userId}'}
       $.ajax({
           type:'post',
           url:'CartServlet?method=goCart',
           data:data,
           dataType:'json',
           success:function (data) {
               alert(data.msg)
           },error:function (data) {
               console.log(data.status)
           }
       })
        }
    $('.Cart').on('click',function (e) {
        $('.mini').css('display','none')
        let data={'userId':'${user.userId}'}
        $.ajax({
            type: 'post',
            url: 'CartServlet?method=selectCart',
            data:data,
            dataType: 'json',
            success:function (data) {
                console.log(data)
                sessionStorage.setItem("cartList",data)

                let result = data.result;
                console.log(result)
                let str=''
                $.each(data,function (i,obj) {
                    str +='<div class="myCart">'
                    str +='<div class="photo">'
                    str +='<img src="images/'
                    str +=obj.imgPath+'"></div>'
                    str +='<div class="cartMsg">'
                    str +='<h5>'
                    str +=obj.goodsName+'</h5>'
                    str +='<h5>'
                    str +=obj.goodsNum+'</h5>'
                    str +='<h5>'
                    str +=obj.price+'</h5>'
                    str +=obj.createTime
                    str +='</div>'
                })
                $('.body').append(str)
            },error:function (data) {
                console.log(data.status)
            }
        })
    })
    $('.home').on('click',function (e) {
        window.location.href='IndexServlet'
    })

</script>
</body>
</html>

