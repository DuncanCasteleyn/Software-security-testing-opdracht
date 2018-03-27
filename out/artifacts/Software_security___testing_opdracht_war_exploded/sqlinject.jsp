<%@ page import="be.ap.security.data.Products" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: Duncan
  Date: 27/03/2018
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>SQL Injection</title>
</head>
<body>
    <% out.print(Products.getProducts(request.getParameter("search"))); %>
</body>
</html>
