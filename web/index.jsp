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
    <title>$Title$</title>
  </head>
  <body>
  <h1> "Register for VRL appointment! </h1>
  <form action="Reg.jsp" method="get">
      First Name: <input type="text" name="first_name"/>
      <br />
      Last Name: <input type="text" name="last_name"/>
      <br />
      Email: <input type="text" name="email"/>
      <br />
      Time Slot: <input type="datetime-local" name="slot"/>
      <input type="submit" value="Submit"/>
  </form>
  </body>
</html>
