<%--
  Created by IntelliJ IDEA.
  User: nolanmurphy
  Date: 2019-05-04
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Virtual Discovery</title>

</head>
<body>
<jsp:include page="TopMenu.jsp" flush="true" />
<div class="intro">
    <h1>Welcome to Virtual Discovery</h1>
    <p>Virtual Discovery brings you cutting edge virtual labs for students, teachers, or anybody with an interest in science
        Our virtual labs allow you to perform science experiments from the comfort of your own home, anywhere in the world.</p>
    <h3>To celebrate our launch, we are offering you an opportunity to try our first physics diffraction simulation lab.</h3>
    <p>To get started, click the button below and register for an access time. During your time slot, come back and enter your access
    pin to download the diffraction software.</p>
    <form action="regForm.jsp" method="get">
        <input type="submit" value="Register Now" />
    </form>
</div>
</body>
</html>
