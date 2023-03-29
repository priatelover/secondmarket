<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/5
  Time: 16:36
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
        .basic-grey {
            margin-left: auto;
            margin-right: auto;
            max-width: 500px;
            background: #F7F7F7;
            padding: 25px 15px 25px 10px;
            font: 12px Georgia, "Times New Roman", Times, serif;
            color: #888;
            text-shadow: 1px 1px 1px #FFF;
            border: 1px solid #E4E4E4;
        }

        .basic-grey h1 {
            font-size: 25px;
            padding: 0px 0px 10px 40px;
            display: block;
            border-bottom: 1px solid #E4E4E4;
            margin: -10px -15px 30px -10px;
            color: #888;
        }

        .basic-grey h1 > span {
            display: block;
            font-size: 11px;
        }

        .basic-grey label {
            display: block;
            margin: 0px;
        }

        .basic-grey label > span {
            float: left;
            width: 20%;
            text-align: right;
            padding-right: 10px;
            margin-top: 10px;
            color: #888;
        }

        .basic-grey input[type="text"] {
            border: 1px solid #DADADA;
            color: #888;
            height: 30px;
            margin-bottom: 16px;
            margin-right: 6px;
            margin-top: 2px;
            outline: 0 none;
            padding: 3px 3px 3px 5px;
            width: 70%;
            font-size: 12px;
            line-height: 15px;
            box-shadow: inset 0px 1px 4px #ECECEC;
            -moz-box-shadow: inset 0px 1px 4px #ECECEC;
            -webkit-box-shadow: inset 0px 1px 4px #ECECEC;
        }


        .basic-grey .button {
            background: #E27575;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            box-shadow: 1px 1px 5px #B6B6B6;
            border-radius: 3px;
            text-shadow: 1px 1px 1px #9E3F3F;
            cursor: pointer;

        }


    </style>
</head>
<body>

<form action="AdminGoodsServlet?method=updateAction" method="post">
    <div class="basic-grey">
        <h1>商品编号：${goodsOne.goodsNum}的基本信息
            <span>请谨慎修改！！！！！！</span>
        </h1>

        <label>
            <span>ID :</span>
            <input id="ip" type="text" name="Id" value="${goodsOne.goodsId}" readonly/>
        </label>
        <label>
            <span>编号:</span>
            <input type="text" name="num" value="${goodsOne.goodsNum}" />
        </label>
        <label>
            <span>名称 :</span>
            <input type="text" name="name" value="${goodsOne.goodsName}" />
        </label>
        <label>
            <span>图片 :</span>
            <input type="text" name="path" value="${goodsOne.imgPath}" />
        </label>
        <label>
            <span>类型 :</span>
            <input type="text" name="type" value="${goodsOne.goodsType}" />
        </label>
        <label>
            <span>价格 :</span>
            <input type="text" name="price" value="${goodsOne.price}"/>
        </label>
        <label>
            <span>&nbsp;</span>
            <input type="submit" class="button" value="点击提交"/>
        </label>
    </div>
</form>
</body>
</html>
