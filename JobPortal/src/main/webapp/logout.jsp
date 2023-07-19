<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>go forward.com</title>
</head>
<%
session.invalidate();
response.sendRedirect("index.html");

%>
<body>

</body>
</html>