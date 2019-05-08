<%@ page import="test_files.InputValidator" %><%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-05-07
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Administrator</title>
</head>
<body>
    <%@page import="test_files.InputValidator" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="java.sql.SQLException" %>
    <jsp:include page="TopMenu.jsp" flush="true" />
    <%
        String enteredPassword = request.getParameter("adminPassword");
        InputValidator validator = InputValidator.getInstance();
        System.out.println(enteredPassword);
        // Handle incorrect password
        if (!enteredPassword.equals("PASSWORD")){
            %>
            <h1>Password incorrect!</h1>
            <form action="adminLogin.jsp"><input type="submit" value="Go Back"></form>
           <%
        } else {// Allow admin to remove a listing%>
    <h2>Database Statistics:</h2>
    <h3>Total number of bookings: <%=validator.numBookings()%></h3>


    <h2>Full Table:</h2>
    <table border="2">
        <tr>
            <td>ID</td>
            <td>First Name</td>
            <td>Last Name</td>
            <td>Email</td>
            <td>Slot</td>
        </tr>
        <%
            try{
            ResultSet rs = validator.getAllBookings();
            while (rs.next()){
                %>
        <tr><td><%=rs.getInt("id")%></td>
        <td><%=rs.getString("email")%></td>
        <td><%=rs.getString("first_name")%></td>
        <td><%=rs.getString("last_name")%></td>
        <td><%=rs.getString("slot")%></td></tr>
        <%
                }
            rs.close();
            } catch (SQLException e){
                e.printStackTrace();
                }
        %>
    </table>
    <h2>Enter an Email Address to Remove:</h2>
    <form action="removalVerify.jsp" method="get">
        <input type="text" name="emailToRemove"/>
        <input type="submit" value="Remove"/></form>
    <%}%>
</body>
</html>
