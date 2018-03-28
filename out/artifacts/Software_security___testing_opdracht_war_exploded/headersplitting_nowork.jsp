<%--
  Created by IntelliJ IDEA.
  User: Duncan
  Date: 28/03/2018
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    response.setStatus(HttpServletResponse.SC_MOVED_TEMPORARILY);
    response.setContentType("text/html");
    response.setContentLength(13);
    response.setHeader("Location", request.getRequestURI() + "/..");
%>
