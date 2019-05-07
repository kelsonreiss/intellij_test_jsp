<%--
  Created by IntelliJ IDEA.
  User: kelson
  Date: 2019-05-07
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Entry</title>
</head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<h1>Enter Password to Access Admin Mode</h1>
<form action="adminPage.jsp" method="get">
    <table>
        <tr>
            <td>Password:</td><td><input type="password" name="adminPassword" /></td> <td><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form>
</body>
</html>
