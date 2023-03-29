<%--
  Created by IntelliJ IDEA.
  User: pp
  Date: 2023/3/4
  Time: 23:18
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
</head>
<body>
<p>当前在线人数${count}</p>
</body>
</html>
