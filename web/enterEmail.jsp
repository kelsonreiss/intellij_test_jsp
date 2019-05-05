<%--
  Created by IntelliJ IDEA.
  User: nolanmurphy
  Date: 2019-05-04
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Virtual Lab Access</title>
</head>
<body>
<jsp:include page="TopMenu.jsp" flush="true"/>
<h1>Access Diffraction Simulator During Scheduled Booking Time</h1>
<form action="timeVerify.jsp" method="get">
    <table>
        <tr>
            <td>Email:</td><td><input type="text" name="email" /></td> <td><input type="submit" value="Submit"/></td>
        </tr>
    </table>
</form>
</body>
</html>
