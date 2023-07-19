<%@page import="applyingprocedure.GetDataOfAppliedUser"%>
<%@page import="comman.CardData"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>go forward.com</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="applied.css">
</head>
<%
String id = (String)session.getAttribute("id");
Vector<CardData> v = GetDataOfAppliedUser.applieduser(id);
%>
<body>

<div class="header">
<a href="employeesection.jsp" class="back-button"><i class="bi bi-arrow-left-circle-fill"></i></a>
<h2>Here is your Applied Cards</h2>
</div>
 <div class="main">
<%for(CardData cd :v){ 
	  String pathforimage="downloads//"+cd.cardimagename;

  %>
        <div class="card">
            <img src=<%=pathforimage%> alt="Image ">
            <h3><%=cd.companyname %></h3>
            <p><%=cd.experience %></p>
            <p><%=cd.location%></p>
            <a id="apply" href="#'<%=cd.cardid%>'">Apply</a>
            <a href="AboutCard.jsp?cardid='<%=cd.cardid%>'">About more</a>
        </div>
   <% }%>
   </div>
</body>
</html>