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
<jsp:include page="TopMenu.jsp" flush="true" />
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
        <table>
            <tr>
                <td align="right">First Name:</td> <td><input type="text" name="first_name" value=<%= firstName%>></td>
            </tr>
            <tr>
                <td align="right">Last Name:</td> <td><input type="text" name="last_name" value=<%= lastName%>></td>
            </tr>
            <tr>
                <td align="right">Email:</td> <td><input type="text" name="email" value=<%= email%>></td>
            </tr>
            <tr>
                <td align="right">Time Slot:</td> <td><input type="datetime-local" name="slot"/></td>
            <td><input type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form>

</body>
</html>
