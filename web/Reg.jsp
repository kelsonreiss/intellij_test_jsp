<%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-04-30
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registration Data Submitted</title>
</head>
<body>
    <%@ page import="test_files.InputValidator" %>
    <jsp:include page="TopMenu.jsp" flush="true" />

    <%
        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String email = request.getParameter("email");

        // Must format HTML datetime to java Timestamp
        // https://stackoverflow.com/questions/27827614/conversion-from-datetime-local-to-java-sql-timestamp
        String slot_string = request.getParameter("slot").replace("T", " ").concat(":00");
        System.out.println("TIMESTAMP String: " + slot_string);
        System.out.println("Loading driver...");

        // Check if valid entry and insert if so
        InputValidator validator = InputValidator.getInstance();
        String result = validator.validateEntry(firstName, lastName, email, slot_string);
        System.out.println("Result of validator: " + result);
        if (result.equals(InputValidator.successMsg)){
            %>
                <h4> Booking successful!</h4>
                <h3> Name: </h3><p> (<%= " " + firstName+" " + lastName%>)</p>
                <h3> Login: </h3><p> (<%= " " + email%>)</p>
                <h3> Time Slot: </h3><p> (<%= "An hour beginning at " + slot_string.split(" ")[1] + " on " +  slot_string.split(" ")[0]%>)</p>
            <%
        }
        // If booking already exists under this user email, print details and allow user to modify or cancel
        else if (result.contains(InputValidator.existingBookingMsg)){
            %>
                <h4> <%=result %></h4>
                <form action="cancel.jsp" method="get">
                    <%
                        session.setAttribute("email", email);
                    %>
                    <input type="submit" value="Cancel"/>
                </form>
                <form action="modify.jsp" method="get">
                    <%
                        session.setAttribute("email", email);
                     %>
                    <input type="submit" value="Modify"/>
                 </form>
            <%
        }

    %>





</body>
</html>
