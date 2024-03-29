<%@ page import="be.ap.security.data.Memos" %>
<%@ page import="be.ap.security.data.WebsiteUsers" %>
<%@ page import="be.ap.security.entities.Memo" %>
<%@ page import="be.ap.security.entities.WebsiteUser" %>
<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Assignment Software Security &amp; Testing: Type 0 XSS Attack</title>
    <link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
    <link href='css/global.css' rel='stylesheet'/>
</head>
<%
    if(request.getParameter("reset") != null && request.getParameter("reset").equals("1")) {
        Memos.reset();
    }
    String username = request.getParameter("username");
    if (username != null) {
        WebsiteUser websiteUser = WebsiteUsers.getWebsiteUser(username);
        if (websiteUser != null && websiteUser.logIn(request.getParameter("psw"))) {
            session.setAttribute("loggedInAs", websiteUser);
            session.setMaxInactiveInterval(Integer.MAX_VALUE);
            Cookie cookie = new Cookie("loggedInAs", UUID.randomUUID().toString());
            cookie.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(cookie);
            WebsiteUsers.addSessionCookie(cookie.getValue(), websiteUser);
        }
    } else if(request.getCookies() != null) {
        session.setAttribute("loggedInAs", WebsiteUsers.getSession(request.getCookies()));
    }
    WebsiteUser loggedInAs = (WebsiteUser) session.getAttribute("loggedInAs");
%>
<body>
<h1 class="structural">XSRF Attack</h1>
<section id="mainContent">
    <div class="wrapper">
        <%
            if (loggedInAs != null) {
                String param = request.getParameter("delete");
                if (param != null) {
                    try {
                        Memos.removeMemo("root", Long.parseLong(param)); %>
        <p>The memo with id <%= param %> was successfully deleted.</p>
        <%
        } catch (NumberFormatException e) { %>
        <p>Wrong delete parameter provided we required a numeric value.</p>
        <% }
        }
        %>
        <h2>Internal memos:</h2>
        <article>
            <% for (Memo memo : Memos.getMemos().get(loggedInAs.getUsername())) { %>
            <h3>Memo id: <%= memo.getId() %>
            </h3>
            <h4>Memo author: <%= memo.getAuthor() %>
            </h4>
            <p><%= memo.getText() %>
            </p>
            <p>Created on  <%= memo.getCreationDate().toString() %>
            </p>
            <p><a href="XSRF.jsp?delete=<%= memo.getId() %>">Delete memo</a></p>
            <% }
            } else {
            %>
            <h2>Not logged in</h2>
            <form action="XSRF.jsp" method="POST">
                <label for="username"><b>Username</b></label>
                <input type="text" placeholder="Enter Username" id="username" name="username" required>

                <label for="psw"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" id="psw" name="psw" required>
                <button type="submit">Login</button>
            </form>
            <% }%>
        </article>
        <form action="XSRF.jsp" method="POST">
            <input type="hidden" value="1" id="reset" name="reset" required>
            <button type="submit">Reset memos</button>
        </form>
    </div>
</section>
</body>

</html>