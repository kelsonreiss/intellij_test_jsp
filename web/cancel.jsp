<%@ page import="test_files.InputValidator" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-04-30
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

    <%
        InputValidator validator = InputValidator.getInstance();
        if (validator.deleteRecord((String)session.getAttribute("email"))){
            %>
                <h4>Booking cancelled successfully!</h4>
            <%
        } else {
            %>
                <h4>Booking failed.</h4>
            <%
        }
    %>

    <form action="index.jsp" >
        <input type="submit" name="Make New Booking"/>
    </form>

</body>
</html>
