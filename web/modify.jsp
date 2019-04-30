<%@ page import="test_files.InputValidator" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-04-30
  Time: 18:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify Reservation</title>
</head>
<body>
    <%
        InputValidator validator = InputValidator.getInstance();
        String email = (String)session.getAttribute("email");
        ResultSet record = validator.retrieveRecord(email);
        String firstName = "";
        String lastName = "";
        try {
            record.first();
            firstName = record.getString("first_name");
            lastName = record.getString("last_name");
        } catch (SQLException e){
            e.printStackTrace();
        }
        // Delete old record associated with this email
        validator.deleteRecord(email);


    %>

    <form action="Reg.jsp" method="get">
        First Name: <input type="text" name="first_name" value=<%= firstName%> >
        <br />
        Last Name: <input type="text" name="last_name" value=<%= lastName%>>
        <br />
        Email: <input type="text" name="email" value=<%= email%>>
        <br />
        Time Slot: <input type="datetime-local" name="slot"/>
        <input type="submit" value="Save"/>
    </form>

</body>
</html>
