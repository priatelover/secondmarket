<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/11
  Time: 19:30
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
        .file {
            position: relative;
            display: inline-block;
            background: #D0EEFF;
            border: 1px solid #99D3F5;
            border-radius: 4px;
            padding: 4px 12px;
            overflow: hidden;
            color: #1E88C7;
            text-decoration: none;
            text-indent: 0;
            line-height: 20px;
        }
        .file input {
            position: absolute;
            font-size: 100px;
            right: 0;
            top: 0;
            opacity: 0;
        }
        .file:hover {
            background: #AADFFD;
            border-color: #78C3F3;
            color: #004974;
            text-decoration: none;
        }
        #img_div{
            width:100px;
            height:100px;
            border:1px dashed #000;
            margin:0 auto;
            position: relative;
        }

        #img_div::before{
            content: "";
            position: absolute;
            left: 35%;
            top: 50%;
            width: 30px;
            border-top: 1px solid;
        }

        #img_div::after {
            content: "";
            position: absolute;
            left: 50%;
            top: 35%;
            height: 30px;
            border-left: 1px solid;
        }
        #img_div>img{
            width: 100%;
            height: 100%;
        }
        .form{
            width: 40%;
            border: 1px solid black;
            margin:  100px auto;
            text-align: center;
            vertical-align: middle;
            border-radius: 15px;
        }
        .form input{
            width: 60%;
            height: 50px;
            margin: 10px auto;
            border-radius: 15px;
        }
        #btn{
            margin-top: 50px;
            margin-bottom: 50px;
            width: 20%;
            background-color: #F5F5DC;
        }
    </style>
</head>
<body>
<%--<form method="post" enctype="multipart/form-data" action="AddGoodsServlet">--%>
<%--    <input type="text" placeholder="请输入你要售卖的货物名称"><br>--%>
<%--    <input type="text"  placeholder="请输入你想要售卖的价格"><br>--%>
<%--    <input type="text" placeholder="请输入物品类型"><br>--%>
<%--    <a class="file">点击上传--%>
<%--        <input type="file" name="file" id="file">--%>
<%--    </a><br>--%>
<%--    <input type="submit" value="点击提交">--%>
<%--</form>--%>
<form method="post" enctype="multipart/form-data" action="AddGoodsServlet?userId=${user.userId}" class="form">
    <div style="width: 100%;height: 100px;font-weight: 600;font-size: 45px;margin-top: 50px">
        <span>你要售卖的商品信息</span>
    </div>
    <input type="text" placeholder="请输入你要售卖的货物名称" name="goodsName" value=""><br>
    <input type="text"  placeholder="请输入你想要售卖的价格" name="price" value=""><br>
    <input type="text" placeholder="请输入物品类型" name="type" value=""><br>
    <div id="img_div">
        <img id="imgSelf">
        <input type="file" id="imgUpload" accept="image/*" style="display:none;" name="file">
    </div>
    <input type="submit" value="点击提交" id="btn">
</form>
<script src="../../js/jquery-3.6.3.min.js"></script>
<script>
    $("#imgSelf").click(function(){
        $("#imgUpload").click();
    });
    // 选择图片并显示
    $("#imgUpload").change(function() {
        var obj = document.getElementById("imgUpload");
        var oFReader = new FileReader();
        oFReader.readAsDataURL(obj.files[0]);
        oFReader.onload = function(oFREvent) {
            // 消除伪元素“+”
            var style=document.createElement('style');//创建一个<style>标签
            var change=document.createTextNode('#img_div:before{content:none;} #img_div:after{content:none;}')//更改后伪元素的样式
            style.appendChild(change);//把样式添加到style标签里
            document.body.appendChild(style);//把内联样式表添加到html中
            // 图片以base64的形式显示在页面
            var base64 = oFREvent.target.result;
            $("#imgSelf").attr("src", base64);
        }
    });
</script>
</body>
</html>
