<%--
  Created by IntelliJ IDEA.
  User: nolanmurphy
  Date: 2019-05-05
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Download Virtual Lab</title>
</head>
<body>
<%
    String filename = "VirtualLab.zip";
    String filepath = "/resources/";
    response.setContentType("APPLICATION/OCTET-STREAM");
    response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");

    java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);

    int i;
    while ((i=fileInputStream.read()) != -1) {
        out.write(i);
    }
    fileInputStream.close();
%>
</body>
</html>
