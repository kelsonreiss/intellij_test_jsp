<%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-05-07
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@page import="test_files.InputValidator" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:include page="TopMenu.jsp" flush="true"/>

<%
    String removalEmail = request.getParameter("emailToRemove");
    InputValidator validator = InputValidator.getInstance();
    ResultSet results = validator.retrieveRecord(removalEmail);
    boolean success = validator.deleteRecord(removalEmail);
    if (success && results.next()) {
        %><h1>Email Deleted Successfully!</h1><%
    } else {
        %><h1>Failed to Delete Email.</h1><%
    }
%>
<head>
    <title>Removal Verification</title>
</head>
<body>
    <form action="adminPage.jsp">
        <input type="submit" value="Go Back">
        <input type="hidden" value="PASSWORD" name="adminPassword">
    </form>
</body>
</html>
