<%--
  Created by IntelliJ IDEA.
  User: nolanmurphy
  Date: 2019-05-04
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@ page import="test_files.InputValidator" %>
<jsp:include page="TopMenu.jsp" flush="true" />
<%



    String userEmail = request.getParameter("email");
    InputValidator validator = InputValidator.getInstance();
    int result = validator.currentAccess(userEmail);

    if (result == 0) { %>
        <head>
            <title>Access Virtual Lab</title>
        </head>
        <body>
            <p><a href="resources/VirtualLab.zip">Download Diffraction Simulator</a></p>
        </body>
    <% }

    else if (result == 1) { %>
        <head>
            <title>Come Again</title>
        </head>
        <body>
            <h3>Please come back during your scheduled booking time.</h3>
        </body>
        <% }
    else { %>
        <head>
            <title>Come Again</title>
        </head>
        <body>
            <h3>We were unable to locate the email you entered. Please reenter your email. If you are not registered, <a href="regForm.jsp">click here</a>.</h3>
            <form action="timeVerify.jsp" method="get">
                <table>
                    <tr>
                        <td>Email</td><td><input type="text" name="email" /></td> <td><input type="submit" value="Submit"/></td>
                    </tr>
                </table>
            </form>
        </body>
            <% }
%>
</html>
