<%--
  Created by IntelliJ IDEA.
  User: Duncan
  Date: 28/03/2018
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Header splitting</title>
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link href='css/global.css' rel='stylesheet'/>
</head>
<body>
<h1 class="structural">Header splitting</h1>
<section id="mainContent">
    <div class="wrapper">
        <% String author = null;
            if (request.getCookies() != null) {
                for (Cookie cookie : request.getCookies()) {
                    if (cookie.getName().equals("author")) {
                        author = cookie.getValue();
                        break;
                    }
                }
            }
            if (author == null) {
                author = request.getParameter("author");
                if (author != null) {
            /*Cookie cookie = new Cookie("author", author);
            cookie.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(cookie);*/
                    response.setHeader("Set-Cookie", "author=" + author);
            /*response.setHeader("Set-Cookie", "author=Jacob\r\n" +
                    "Content-Length: 166\r\n" +
                    "Content-Type: text/html;charset=UTF-8\r\n\r\n" +
                    "<html>\n" +
                    "<body>\n" +
                    "hello" +
                    "</body>\n" +
                    "</html>");  I tried hard coding a response splitting through, but it seems to be entirely fixed for jsp pages. */
                }
            }
            if (author == null) { %>
        <h2>set author name</h2>
        <p>Please enter a nickname to post your messages with your ip will be logged.</p>
        <p>A cookie will be used to store your username</p>
        <form action="headersplitting.jsp" method="POST">
            <label for="author"><b>Author name</b></label>
            <input type="text" value="<%= "Hacker man\r\n" +
                    "Content-Length: 166\r\n" +
                    "Content-Type: text/html;charset=UTF-8\r\n\r\n" +
                    "<html>\r\n" +
                    "<body>\r\n" +
                    "hello" +
                    "</body>\r\n" +
                    "</html>" %>" id="author" name="author" required>
            <button type="submit">Login</button>
        </form>
        <% } else {
        %>
        <h2>Welcome <%= author %>
        </h2>
        <% }%>
    </div>
</section>
</body>
</html>
