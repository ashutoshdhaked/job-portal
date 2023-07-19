<%@page import="comman.GetCardData"%>
<%@page import="java.util.Vector"%>
<%@page import="comman.CardData"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>go forward.com</title>
 <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      margin: 0;
      padding: 0;
    }

    .section {
      background-color: #ffffff;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
      padding: 20px;
      margin-bottom: 20px;
    }

    .section h2 {
      font-size: 20px;
      margin-top: 0;
      margin-bottom: 10px;
    }

    .section p {
    font-family: Arial, sans-serif;
      margin: 0;
    }

    @media screen and (max-width: 600px) {
      .section {
        padding: 10px;
      }
    }
  </style>
</head>
<%
 Vector <CardData> v =GetCardData.getdata();
String mycardid = request.getParameter("cardid");
CardData cd = null;
for(CardData x :v){
	x.cardid = "'"+x.cardid+"'";
	if(x.cardid.equals(mycardid)){
		cd = x;
	}
}
%>
<body>
  <div class="section">
    <h2>Company Name</h2>
    <pre><%=cd.companyname %></pre>
  </div>

  <div class="section">
    <h2>Work Location</h2>
    <pre><%=cd.location %></pre>
  </div>

  <div class="section">
    <h2>Required Experience</h2>
    <pre><%=cd.experience %></pre>
  </div>

  <div class="section">
    <h2>About Skill</h2>
    <pre><%=cd.aboutskill %></pre>
  </div>

  <div class="section">
    <h2>About Post</h2>
    <pre><%=cd.aboutpost %></pre>
  </div>

  <div class="section">
    <h2>About Company</h2>
    <pre><%=cd.aboutcompany %></pre>
  </div>
</body>
</html>