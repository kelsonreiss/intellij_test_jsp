<%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-05-07
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="TopMenu.jsp" flush="true" />
    <%
        String enteredPassword = request.getParameter("adminPassword");
        System.out.println(enteredPassword);
        // Handle incorrect password
        if (!enteredPassword.equals("PASSWORD")){
            %>
            <h1>Password incorrect!</h1>
            <form action="adminLogin.jsp"><input type="submit" value="Go Back"></form>
           <%
        } else {
            // Allow admin to remove a listing
            %>
    <h2>Enter an Email Address to Remove:</h2>
    <form action="removalVerify.jsp" method="get">
        <input type="text" name="emailToRemove"/>
        <input type="submit" value="Remove"/></form>
    <%}%>
</body>
</html>
