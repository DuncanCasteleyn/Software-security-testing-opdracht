<%@ page import="be.ap.security.data.Products" %>
<%--
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
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link href='css/global.css' rel='stylesheet'/>
</head>
<body>
<section id="mainContent">
    <div class="wrapper">
        <p>
            <%= Products.getProducts(request.getParameter("search")) %>
        </p>
        <br/>
        <form method="GET">
            <label for="search"><b>Search on product name</b></label>
            <input type="text" placeholder="Enter product name" id="search" name="search">
            <p>Use % as wildcard.</p>
            <button type="submit">Search</button>
        </form>
    </div>
</section>
</body>
</html>
