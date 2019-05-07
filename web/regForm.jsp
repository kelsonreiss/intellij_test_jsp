<%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-04-29
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Register</title>
  </head>
  <body>
  <jsp:include page="TopMenu.jsp" flush="true" />
  <div class="content" style="clear:both">
    <h1> Register for a VRL appointment! </h1>
    <form action="Reg.jsp" method="get">
        <table>
            <tr>
                <td align="right">First Name:</td> <td><input type="text" name="first_name"/></td>
            </tr>
            <tr>
                <td align="right">Last Name:</td> <td><input type="text" name="last_name"/></td>
            </tr>
            <tr>
                <td align="right">Email:</td> <td><input type="text" name="email"/></td>
            </tr>
            <tr>
                <td align="right">Time Slot:</td> <td><input type="datetime-local" name="slot"/></td>
                <td><input type="submit" value="Submit"/></td>
            </tr>
        </table>
    </form>
  </div>
  </body>
</html>
